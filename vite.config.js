import { defineConfig } from "vite";
import FullReload from "vite-plugin-full-reload";
import RubyPlugin from "vite-plugin-ruby";
import StimulusHMR from "vite-plugin-stimulus-hmr";
import { svelte } from "@sveltejs/vite-plugin-svelte";

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 200 }),
    StimulusHMR(),
    svelte(),
  ],
});
