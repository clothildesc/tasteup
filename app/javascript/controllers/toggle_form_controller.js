import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["category", "button"]

  fire(event) {
    event.preventDefault();
    this.categoryTarget.classList.toggle("d-none");
  }
}
