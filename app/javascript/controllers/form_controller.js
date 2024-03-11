import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  connect() {
    console.log("Hello")
  }

  next(event) {
    event.preventDefault()
    console.log("Next")
  }
}
