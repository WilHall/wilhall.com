import "../controllers";
import "sortable-tablesort/sortable.min.js";
import "@hotwired/turbo-rails";
import "chartkick/chart.js"; // Example: Load Rails libraries in Vite.
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import "lightgallery/css/lightgallery.css";

// Example: Load Rails libraries in Vite.
//

// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log("Vite ⚡️ Rails");

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log(
  "Visit the guide for more information: ",
  "https://vite-ruby.netlify.app/guide/rails",
);

Turbo.session.drive = false;
//
Turbo.start();
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
