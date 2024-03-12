import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="url-or-form"
export default class extends Controller {
  static targets = ["nextStep"];

  show(event) {
    event.preventDefault();
    const aim = event.currentTarget.dataset.aim;
    this.nextStepTargets.forEach((step) => step.classList.add('d-none'));
    this.nextStepTargets.find((step) => step.dataset.aim === aim).classList.remove('d-none');
  }
}
