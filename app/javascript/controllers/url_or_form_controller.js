import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="url-or-form"
export default class extends Controller {
  static targets = ["nextStep", "choices"];

  connect() {
    this.nextStepTargets.forEach((step) => step.classList.add("d-none"));
  }

  show(event) {
    event.preventDefault();
    const aim = event.currentTarget.dataset.aim;
    this.nextStepTargets
      .find((step) => step.dataset.aim === aim)
      .classList.remove("d-none");
    this.choicesTargets.forEach((choice) => choice.classList.add("d-none"));
  }

  return(event) {
    event.preventDefault();
    this.choicesTargets.forEach((choice) => choice.classList.remove("d-none"));
    this.nextStepTargets.forEach((step) => step.classList.add("d-none"));
  }
}
