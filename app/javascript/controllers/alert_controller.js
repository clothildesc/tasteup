import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.fadeOutAlert();
    }, 2000);
  }

  fadeIn(element) {
    element.classList.add("fade-in")
    element.style.display = "block"
  }

  fadeOutAlert() {
    this.element.classList.add('fade-out');
    setTimeout(() => {
      this.element.remove();
    }, 500);
  }

}
