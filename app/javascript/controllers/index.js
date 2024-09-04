import { Application } from "@hotwired/stimulus";
import { registerControllers } from "stimulus-vite-helpers";
import Lightbox from "@stimulus-components/lightbox";

const application = Application.start();
const controllers = import.meta.glob("./**/*_controller.js", { eager: true });

registerControllers(application, controllers);
application.register("lightbox", Lightbox);
