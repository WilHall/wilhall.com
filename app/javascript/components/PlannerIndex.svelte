<script>
    import MultiSelect from 'svelte-multiselect'
    import {dndzone} from 'svelte-dnd-action';
    import {flip} from 'svelte/animate';
    import { tooltip } from "@svelte-plugins/tooltips";
    import _ from 'lodash'

    export let interaction;
    export let date;
    export let departmentDependencies;
    export let departmentEstimates;
    export let data;

    if (data["departments"]["Waiting Room"] === undefined) {
        data["departments"]["Waiting Room"] = []
    }

    const saveData = _.debounce(() => {
        fetch(
            new URL(window.location.href),
            {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    date: date,
                    data: data
                }),
            },
        )
    }, 500)

    $: data, saveData();

    const resetData = () => {
        fetch(
            new URL(window.location.href),
            {
                method: "DELETE",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    date: date
                }),
            },
        ).then(() => {
            window.location.reload()
        });
    }

    const handleDrag = (event, department) => {
        data["departments"][department] = event.detail.items
    }

    const departmentShortname = (department_name) => department_name.replace(' Department', '')

    const departmentThroughput = (department) => Object.values(data["departments"][department]).reduce((acc, user) => acc + (user["selected"] ? user["average_daily_case_count"] : 0), 0)

    const hasLoadIssue = (department) => loadIssue(department) != false
    const loadIssue = (department) => {
        const departmentEstimate = departmentEstimates[department]

        if (!(department in departmentEstimates) || departmentEstimate == 0) {
            return false
        }

        const targetThroughput = departmentThroughput(department)

        if ((departmentEstimate - targetThroughput) >= 10) {
            return `The throughput of this department (${targetThroughput} cases/day) subceeds the expected number of cases by ${departmentEstimate - targetThroughput} cases.`
        }

        return false
    }

    const hasDependencyIssue = (department) => dependencyIssue(department) != false
    const dependencyIssue = (department) => {
        if (!(department in departmentDependencies)) {
            return false
        }

        const targetThroughput = departmentThroughput(department)
        const dependenciesThroughput = departmentDependencies[department].reduce((sum, dependency) => (sum + data['selectedDepartments'].includes(dependency) ? departmentThroughput(dependency) : 0),0)

        if ((targetThroughput - dependenciesThroughput) >= 10) {
            return `The throughput of this department (${targetThroughput} cases/day) exceeds the throughput of dependant departments (${departmentDependencies[department].join(", ")}) by ${targetThroughput - dependenciesThroughput} cases.`
        }

        if ((dependenciesThroughput - targetThroughput) >= 10) {
            return `The throughput of this department (${targetThroughput} cases/day) subceeds the throughput of dependant departments (${departmentDependencies[department].join(", ")}) by ${dependenciesThroughput - targetThroughput} cases.`
        }

        return false
    }
</script>

<div>
    <div class="flex pb-5 items-center justify-between gap-5">
        <div class="flex flex-col">
            <label for="departments" class="font-bold">
                Departments
            </label>
            <MultiSelect disabled={!interaction} id="departments" bind:selected={data["selectedDepartments"]} options={Object.keys(data["departments"])}
                         outerDivClass="flex-1 bg-white"
                         closeDropdownOnSelect={true}/>
        </div>
        <div class="flex flex-col">
            <button disabled={!interaction} on:click={resetData}
                    class="relative inline-flex items-center px-5 py-2.5 font-bold text-center text-white bg-emerald-700 rounded-lg hover:bg-emerald-800">
                Reset
            </button>
        </div>
    </div>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 3xl:grid-cols-6 gap-5">
        {#each data["selectedDepartments"] as department}
            <div class="bg-zinc-100 rounded-md shadow-lg py-1 px-3 max-h-[50vh]">
                <h2 class="text-xl font-bold">{department}</h2>
                <div class="flex gap-1 items-center">
                    <span class="text-base font-semibold text-zinc-600">{departmentEstimates[department]} cases expected</span>
                    {#if hasLoadIssue(department)}
                        <i class="block fa-solid fa-triangle-exclamation text-amber-500 text-lg pr-1" use:tooltip={{content: loadIssue(department)}}></i>
                    {/if}
                </div>
                <div class="flex gap-1 items-center">
                    <span class="text-base font-semibold text-zinc-600">{data["departments"][department].length} assigned</span>
                    <span>&mdash;</span>
                    <span class="text-base font-semibold text-zinc-600">{departmentThroughput(department)} cases/day</span>
                    {#if hasDependencyIssue(department)}
                        <i class="block fa-solid fa-triangle-exclamation text-amber-500 text-lg pr-1" use:tooltip={{content: dependencyIssue(department)}}></i>
                    {/if}
                </div>
                <hr class="my-4"/>
                <ul use:dndzone={{dragDisabled: !interaction, items: data["departments"][department], flipDurationMs: 200, dropTargetStyle: {}, dropTargetClasses:["outline", "outline-offset-2", "outline-emerald-700"]}}
                    on:consider={(event) => handleDrag(event, department)}
                    on:finalize={(event) => handleDrag(event, department)}
                    class="flex flex-col gap-1 rounded-md overflow-y-scroll max-h-[80%] px-1 py-1">
                    {#each data["departments"][department] as user (user.id)}
                        <li animate:flip={{duration: 200}}
                            title="Primary in {user["department_name"]}.&#013; Cross-trained in {(user['cross_trained_departments'].length > 0 ? user['cross_trained_departments'] : ['no departments']).join(', ')}"
                            class="relative flex justify-between items-center bg-zinc-50 rounded-md shadow-md py-0 px-1 hover:outline hover:outline-emerald-700">
                            <div class="flex gap-2 items-center justify-between">
                                <input disabled={!interaction} type="checkbox" bind:checked={user.selected}/>
                                <div class="flex flex-col whitespace-nowrap">
                                    <div class="font-semibold text-base">{user["name"]}</div>
                                    <div class="flex gap-1 max-w-[50%]">
                                        <span class="-mt-2 text-sm text-zinc-500">{departmentShortname(user["department_name"])}</span>
                                        {#if user["cross_trained_departments"].length > 0}
                                            <i class="block fa-solid fa-shuffle text-zinc-500 text-sm -mt-1"></i>
                                        {/if}
                                        {#each user["cross_trained_departments"] as cross_trained_department, index}
                                            {#if index > 0}
                                                <span class="-mt-2 text-sm text-zinc-500">&bull;</span>
                                            {/if}
                                            <span class="-mt-2 text-sm text-zinc-500">{departmentShortname(cross_trained_department)}</span>
                                        {/each}
                                    </div>
                                </div>
                            </div>
                            <div class="absolute right-0 top-2">
                                {#if user.department_name != department}
                                    <i class="block fa-solid fa-person-walking-dashed-line-arrow-right text-zinc-500 text-lg" title="Reassigned from their original department"></i>
                                {/if}
                                <input disabled={!interaction} type="number" value={user.average_daily_case_count}
                                       on:change={(event) => (user.average_daily_case_count = parseInt(event.target.value))}
                                       class="w-[3.2rem] rounded-md py-0 px-1 font-bold scale-75 {user.average_daily_case_count != user.original_average_daily_case_count ? "bg-orange-50" : ""}"
                                       style="direction: rtl;"/>
                            </div>
                        </li>
                    {/each}
                </ul>
            </div>
        {/each}
    </div>
</div>