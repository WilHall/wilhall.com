## Welcome to Plume & Pith

Plume & Pith is the name of my home studio and art business. My goal is not only to have a space for my art, but to be able to share that space with other local artists in an area where it can be challenging to find studio and kiln space.

## Studio Access

Because my studio is in the basement of my home, studio access is pre-scheduled via my website.

When you schedule a lesson, studio share time, or a pickup/dropoff, the calendar event sent to you via email will contain my phone number and the address of the studio. When you arrive, please text me and I will come around to meet you at the studio door or the front of the house.

You can schedule one-off lessons or studio share time  <%= link_to "on my website", store_path %>, or you can become a monthly member for more regular access.

## Studio Membership

<%= render partial: "memberships" %>

<h2>Clay</h2>
<p>
I stock several clay bodies as well as casting slip from Standard Clay Company. I always keep the following on hand:
</p>
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
      <th class="font-bold px-4 py-2 font-medium"><a href="<%= clay.url %>"><%= clay.identifier %> <%= clay.name %></a></th>
      <td class="px-4 py-2 font-medium"><%= number_to_percentage(clay.shrinkage, precision: 2) %></td>
      <td class="px-4 py-2 font-medium"><%= number_to_percentage(clay.absorption, precision: 2) %></td>
      <td class="italic px-4 py-2 font-medium"><%= clay.description %></td>
    </tr>
  <% end %>
</tbody>
</table>
<p>
You <b>may not</b> bring your own clay to work with in the studio, though you may bring clay home to work with.
</p>
<h2>Other Consumables</h2>
<p>
I have a variety of glazes, underglazes, and decorating supplies available. All these consumables are available for you to use free of charge.
</p>
<p>
You can browse the <%= link_to "glaze options online.", studio_path(anchor: "glazes") %>
</p>
<p>
Additionally:
</p>
<ul class="pl-5 list-disc list-inside">
<li>You may bring your own underglazes and decorating supplies</li>
<li>You may bring your own commercial cone 6 glazes</li>
<li>Portland Pottery in Braintree is the closest ceramics supply shop. I visit regularly to get supplies for the studio. If you want to place an order and have me pick it up, I am happy to do so.</li>
</ul>
<h2>Firing</h2>
<p>
You may fire any clay or glaze as long as it is rated for cone 04 bisque and cone 6 glaze firing. Any damage to the kiln shelves will incur a $10 shelf scraping fee per shelf. If your pieces are likely to drip, you're required to provide your own cookies to fire on or request one from me if available.
</p>
<p>
I am not responsible for any work that is deemed unusable/non-sellable from the result of over firing, kiln error, or accidental damage. In the case of a misfire/under-fire of the kiln, I will re-fire the work at no additional cost.
</p>
<p>
<b>For Kiln Share:</b> You must have enough work to fill at least one shelf (17in x 17in), and turnaround time is 1-2 weeks.
</p>
<p>
<b>For Studio Share:</b> I will fire your pieces as you make them, prioritized ahead of my Kiln Share, and you pay 50% of the Kiln Share cost.
</p>
<table class="border border-slate-200 py-2 px-5">
<thead class="bg-blue-50">
  <tr>
    <th scope="col" class="px-4 py-2"></th>
    <th scope="col" class="px-4 py-2">Kiln Share</th>
    <th scope="col" class="px-4 py-2">Studio Share</th>
  </tr>
</thead>
<tbody>
  <tr class="bg-white border-b">
    <th class="font-bold px-4 py-2 font-medium">Bisque 1 shelf (17in x 17in)</th>
    <td class="px-4 py-2 font-medium">$20</td>
    <td class="px-4 py-2 font-medium">$10</td>
  </tr>
  <tr class="bg-white border-b">
    <th class="font-bold px-4 py-2 font-medium">Glaze 1 shelf (17in x 17in)</th>
    <td class="px-4 py-2 font-medium">$25</td>
    <td class="px-4 py-2 font-medium">$12</td>
  </tr>
  <tr class="bg-white border-b">
    <th class="font-bold px-4 py-2 font-medium">Bisque Full Kiln</th>
    <td class="px-4 py-2 font-medium">$70</td>
    <td class="px-4 py-2 font-medium">$35</td>
  </tr>
  <tr class="bg-white border-b">
    <th class="font-bold px-4 py-2 font-medium">Glaze Full Kiln</th>
    <td class="px-4 py-2 font-medium">$85</td>
    <td class="px-4 py-2 font-medium">$42</td>
  </tr>
</tbody>
</table>
<p>
There is a shelving unit beside the kiln which has a <b>Bisque In</b> and <b>Glaze In</b> shelf for you to place your pieces that are ready to be fired. When placing pieces here, please be careful to not damage other people's work. If something doesn't fit on the shelf, please leave it on your personal shelf until there is room.
</p>
<p>
After pieces have been fired, I will return them to your personal shelf, or hold them on one of my shelves if there is not room.
</p>
<h2>Storage</h2>
<p>
If you have a monthly membership, you have personal shelf storage. This can be used to store your work, tools, consumables, etc. You may bring risers or organizers to augment the shelves.
</p>
<p>
If you run out of room on your shelf, there are shelves nearby designated for shared storage, but please be mindful to not take up all this space - it's also used by non-monthly members.
</p>
<h2>Cleanliness</h2>
<p>
My general expectation is that you leave the studio at least as clean as you found it. This includes:
</p>
<ul class="pl-5 list-disc list-inside">
<li>Wiping down any surface you used</li>
<li>Sweeping up trimmings</li>
<li>Emptying the wheel tray (if full)</li>
<li>Mopping up drips/spills</li>
<li>Cleaning used bats</li>
<li>Cleaning used tools</li>
<li>Don't leave anything in the sink</li>
<li>Put away tools/consumables</li>
<li>Empty throwing water and clean bucket</li>
<li><b>DO NOT</b> wash anything upstairs</li>
</ul>
<p>
I'm not exceptionally strict about this, but I expect everyone to make an effort to keep things clean and tidy so they are usable for the next person and so I am not the only one cleaning.
</p>
<h2>Sink</h2>
<p>
The sink is equipped with a clay trap, which means it's okay to wash your hands and <b>small amounts of clay</b> down the sink. However, when possible, please wash tools etc. into a bucket to catch any large amounts of clay.
</p>
<p>
There is a blue bucket that remains in the sink for pouring dirty water into which helps to catch particulate. <b>Do not pour dirty water directly down the sink.</b>
</p>
<p>
<b>Do not pour glaze down the sink.</b> Please wash as much glaze as you can off tools and containers into the glaze reclaim bucket before giving them a final wash in the sink.
</p>
<p>
When you are done using the sink, please make sure it is wiped down with a sponge.
</p>
<h2>Trash</h2>
<p>
There is a small trash bin next to the <b>Bisque In</b> / <b>Glaze In</b> shelves. Please use this for <i>garbage only</i>.
</p>
<h2>Reclaim</h2>
<p>
I manually reclaim most of the clay scraps generated by the studio. To make this process go as smoothly as possible, please observe the following locations for your scrap clay:
</p>
<ul class="pl-5 list-disc list-inside">
<li><b>Scraps of clay</b> should go in the <b>Lugs/Scraps</b> bin atop the chest of drawers</li>
<li><b>Water/slip</b> should go in the <b>Liquid Reclaim</b> Bucket</li>
<li><b>Everything else</b> should go in the <b>Solid Reclaim</b> Bucket</li>
</ul>