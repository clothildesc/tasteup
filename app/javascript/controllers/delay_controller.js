import { Controller } from "@hotwired/stimulus";
import Typed from 'typed.js';

// Connects to data-controller="delay"
export default class extends Controller {
  connect() {}

  static targets = ["fakeButton", "realButton", "form", "spinner", "input", "typedContainer"];

  show() {
    if (this.inputTarget.value === "") return;

    this.fakeButtonTarget.classList.add("d-none");
    this.formTarget.classList.add("d-none");
    this.spinnerTarget.classList.remove("d-none");

    const typed = new Typed(this.typedContainerTarget, {
      strings: ["J'ajoute les ingrédients...", "J'ajoute les étapes...", "Bonne appétit !"],
      typeSpeed: 50,
      showCursor: false,
    });

    setTimeout(() => {
      this.realButtonTarget.click();
    }, 5000);
  }
}
