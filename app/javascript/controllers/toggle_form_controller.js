import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["ingredient", "button"]

  connect() {
    console.log("hello")
  }

  fire(event) {
    event.preventDefault();
    this.ingredientTarget.classList.toggle("d-none");
  }
}
