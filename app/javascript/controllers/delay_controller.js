import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  submitForm(event) {
    event.preventDefault();
    this.showSpinner();
    this.formTarget.classList.add("d-none");
    setTimeout(() => {
      this.formTarget.submit();
    }, 2000);
  }

  showSpinner() {
    const spinner = document.getElementById("loading-spinner");
    if (spinner) {
      spinner.classList.remove("d-none");
    }
  }
}
