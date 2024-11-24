## Welcome to Plume & Pith

Plume & Pith is the name of my home studio and art business. My goal is not only to have a space for my art, but to be able to share that space with other local artists in an area where it can be challenging to find studio and kiln space.

## Studio Access

Because my studio is in the basement of my home, studio access is pre-scheduled via my website.

When you schedule a lesson, studio share time, or a pickup/dropoff, the calendar event sent to you via email will contain my phone number and the address of the studio. When you arrive, please text me and I will come around to meet you at the studio door or the front of the house.

You can schedule one-off lessons or studio share time  <%= link_to "on my website", store_path %>, or you can become a monthly member for more regular access.

## Studio Membership

<%= render partial: "memberships" %>


## Clay

I stock several clay bodies as well as casting slip from Standard Clay Company. I always keep the following on hand:

<table class="border border-slate-200 py-2 px-5">
<thead class="bg-blue-50">
  <tr>
    <th scope="col" class="px-4 py-2"></th>
    <th scope="col" class="px-4 py-2">Shrinkage</th>
    <th scope="col" class="px-4 py-2">Absorption</th>
    <th scope="col" class="px-4 py-2">Description</th>
  </tr>
</thead>
<tbody>
  <% @clays.each do |clay| %>
    <tr class="bg-white border-b">
      <th class="font-bold px-4 py-2 font-medium"><a href="<%= clay.url %>" target="_blank"><%= clay.identifier %> <%= clay.name %></a></th>
      <td class="px-4 py-2 font-medium"><%= number_to_percentage(clay.shrinkage, precision: 2) %></td>
      <td class="px-4 py-2 font-medium"><%= number_to_percentage(clay.absorption, precision: 2) %></td>
      <td class="italic px-4 py-2 font-medium"><%= clay.description %></td>
    </tr>
  <% end %>
</tbody>
</table>

Please refer to the <%= link_to "studio share page", studio_share_path %> for the hourly and membership clay allotments.

Monthly members track their clay usage the Clay Log on the bulletin board, which resets every month.

You *may not* bring your own clay to work with in the studio, though you may bring clay home to work with.

## Other Consumables

I have a variety of glazes, underglazes, and decorating supplies available. All these consumables are available for you to use when you book studio time.

You can browse the <%= link_to "glaze options online.", studio_path(anchor: "glazes") %>


Additionally:

 - You may bring your own underglazes and decorating supplies
 - You may bring your own commercial cone 6 glazes
 - Portland Pottery in Braintree is the closest ceramics supply shop. I visit regularly to get supplies for the studio. If you want to place an order and have me pick it up, I am happy to do so.

## Firing

### Kiln Share

<div>
    <%= render partial: "kiln_shares/kiln_share_description" %>
</div>

### Studio Share

If you are a monthly member or scheduling hourly studio time, I will fire your work as you make it, prioritized ahead of kiln share work.

There is a shelving unit beside the kiln which has a *Bisque In* and *Glaze In* shelf for you to place your pieces that are ready to be fired.

When placing pieces here, please be careful to not damage other people's work. If something doesn't fit on the shelf, please leave it on your personal shelf until there is room.

After your pieces have been fired, I will return them to your personal shelf, or hold them on one of the shared shelves if there is not room.

### Pricing

Firing cost varies depending on whether you are firing pieces through the Kiln Share or Studio Share:

<table class="border border-slate-200 py-2 px-5">
<thead class="bg-blue-50">
  <tr>
    <th scope="col" class="text-left px-4 py-2">Space</th>
    <th scope="col" class="text-left px-4 py-2">Kiln Share</th>
    <th scope="col" class="text-left px-4 py-2">Studio Share</th>
  </tr>
</thead>
<tbody>
  <tr class="text-left bg-white border-b">
    <th class="font-bold px-4 py-2 font-medium">Bisque 1 shelf (17in x 17in)</th>
    <td class="px-4 py-2 font-medium">$20</td>
    <td class="px-4 py-2 font-medium">$10</td>
  </tr>
  <tr class="text-left bg-white border-b">
    <th class="font-bold px-4 py-2 font-medium">Glaze 1 shelf (17in x 17in)</th>
    <td class="px-4 py-2 font-medium">$25</td>
    <td class="px-4 py-2 font-medium">$12</td>
  </tr>
  <tr class="text-left bg-white border-b">
    <th class="font-bold px-4 py-2 font-medium">Bisque Full Kiln</th>
    <td class="px-4 py-2 font-medium">$70</td>
    <td class="px-4 py-2 font-medium">$35</td>
  </tr>
  <tr class="text-left bg-white border-b">
    <th class="font-bold px-4 py-2 font-medium">Glaze Full Kiln</th>
    <td class="px-4 py-2 font-medium">$85</td>
    <td class="px-4 py-2 font-medium">$42</td>
  </tr>
</tbody>
</table>


## Storage

If your membership includes dedicated shelf storage, you can use this space to store your work, tools, consumables, etc. You may also bring risers or containers to augment and organize your shelf space however you would like.

Temporary shared shelf space is available for non-members, or for members who run out of space on their dedicated shelves. Please be careful around other people's work when using the shared shelves, and be mindful of the amount of space you are using.

## Health & Cleanliness

My general expectation is that you leave the studio at least as clean as you found it. This includes:

 - Wiping down any surface you used
 - Sweeping up trimmings
 - Cleaning and emptying the wheel tray
 - Wiping/Mopping up drips or spills
 - Cleaning used bats
 - Cleaning used tools 
 - Put away tools and consumables
 - Empty and clean throwing water buckets
 - Don't leave anything in the sink, except clean empty buckets
 - *DO NOT* wash anything in the upstairs bathroom, except for relatively clean hands

### Air Quality

Clay and glazes contain very fine particles (especially Silica) ranging from 0.5 microns to 10 microns in size and can be harmful to inhale, potentially causing a type of lung fibrosis called Silicosis.

If you are not already familiar, it is worth [learning about silicosis](https://www.oldforgecreations.co.uk/blog/silicosis-what-it-is-and-how-to-avoid-it) and [how we can prevent it](https://ceramicartsnetwork.org/ceramics-monthly/ceramics-monthly-article/Techno-File-Studio-Dust).

The reality is that making ceramics will always generate some dust, but there are simple steps we can take to reduce that dust to a reliably safe level:

 - Never vaccum up clay or glaze dust
 - Avoid sweeping when possible (prefer mopping)
 - Always use a wet sponges or rags when cleaning surfaces
 - Never trim, carve, or sand bone-dry clay or bisqueware inside the studio
 - Never mix powdered dry ingredients inside the studio
 - Avoid using dry fabrics (rags, aprons) that are caked with dried clay
 - Be mindful of your clothing when leaving the studio; for particularly dirty clothing, consider changing out of your clothes when you arrive home so you do not introduce dry clay or glaze dust into your living space

The studio is equipped with a dehumidifier, HEPA air purifier, and an air quality monitor to help keep the air clean and safe.

### The Sink

The sink is located past the kiln and reclaim area. It is equipped with a clay trap, which means it's okay to wash your hands and *small amounts of clay* down the sink.

In the left side of the sink basin is a blue bucket with a siphon that is used to catch as much clay and other particulate as possible.

Whenever possible, please first wash tools, bats, containers, etc over this bucket before giving them a final rinse into the sink.

### Throwing Water

**Do not pour throwing water directly down the sink.** Throwing water contains a lot of small clay particles that are essential to my reclaim process, and will also quickly clog the clay trap. When you are ready to dispose of your throwing water, please do the following:

1. Pour off the top 3/4 of water into the siphon bucket in the basin of the sink
2. Scrape and stir the rest of the throwing water to suspend the clay particles
3. Pour the remaining throwing water into the liquid reclaim bucket at the reclaim station

### Glaze Waste

**Do not pour glaze waste directly down the sink.** I recommend the following process for managing glaze waste which starts before you begin glazing:

1. Before you begin glazing, grab an empty blue bucket from the sink area, fill it 1/4 full with water, and bring it with you to the glazing area; this is your "clean water"
2. As you are glazing, when you need to clean large amounts of dry or liquid glaze off your tools or sponges, rinse most of it off into the permanent bucket labelled "Liquid Glaze" in the glazing area
3. Subsequently clean your tools and sponges fully in your "clean water" bucket
4. To dispose of your "clean water" bucket, scrape and stir the bottom to suspend any particulate and then pour the water into the siphon bucket in the sink

### Trash

There is a small trash can near the bulletin board which should be used for trash only. Do not dispose of unfired clay or glaze waste in this trash can.

## Reclaim

I manually reclaim most of the clay scraps generated by the studio. To make this process go as smoothly as possible, please observe the following locations for your scrap clay:

 - **The Lugs/Scraps Bin** is located just above the bags of new clay next to the wareboards, and should be used to store any re-usable clay scraps, such as flopped pots that can be easily re-wedged into usable clay
 - **The Liquid Reclaim Bucket** is located in the reclaim area, and should be used to dispose of water that is heavily laden with clay or slip
 - **The Solid Reclaim Bucket** is located in the reclaim area, and should be used to dispose of any other unfired clay scraps