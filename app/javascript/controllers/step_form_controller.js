import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="step-form"
export default class extends Controller {

  static targets = ["step"]

  connect() {
    this.step = 0
    console.log(this.step)
    this.#refresh();
  }

  #refresh() {
    this.stepTargets.forEach(step => step.classList.add('d-none'));
    this.stepTargets.find(step => parseInt(step.dataset.step) === this.step)?.classList?.remove('d-none');
  }

  next(event) {
    event.preventDefault();
    this.step += 1;
    this.#refresh();
  }
}
