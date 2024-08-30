import PlannerIndex from "../components/PlannerIndex.svelte";

const target = document.getElementById("planner-index");

new PlannerIndex({
  target: target,
  props: {
    interaction: JSON.parse(target.dataset["interaction"]),
    date: JSON.parse(target.dataset["date"]),
    departmentDependencies: JSON.parse(
      target.dataset["departmentDependencies"],
    ),
    departmentEstimates: JSON.parse(target.dataset["departmentEstimates"]),
    data: JSON.parse(target.dataset["data"]),
  },
});
