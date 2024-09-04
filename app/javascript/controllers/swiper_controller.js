import { Controller } from "@hotwired/stimulus";
import Swiper from "swiper";
import { Navigation, Pagination } from "swiper/modules";

export default class extends Controller {
  connect() {
    this.swiper = new Swiper(".swiper-container", {
      modules: [Navigation, Pagination],
      pagination: {
        el: ".swiper-pagination",
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
}
