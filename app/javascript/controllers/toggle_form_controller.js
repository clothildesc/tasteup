import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["category", "button"]

  connect() {
    console.log("hello")
    console.log(this.buttonTarget)
  }

  fire(event) {
    console.log("test")
    event.preventDefault();
    this.categoryTarget.classList.toggle("d-none");
  }
}
