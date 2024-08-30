import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { reload: Boolean };

  submit(e) {
    const form = this.element;
    const formData = new FormData(form);

    const params = new URLSearchParams(formData);
    const newUrl = `${form.action}?${params.toString()}`;

    if (this.reloadValue) {
      window.location.href = newUrl;
    } else {
      Turbo.visit(newUrl, { frame: "jobs" });
      history.pushState({}, "", newUrl);
    }
  }
}
