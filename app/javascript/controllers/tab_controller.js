import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "tab"]

  show(event){
    const button = event.currentTarget
    const id = event.params.id
    const tab = this.tabTargets.find(element => parseInt(element.dataset.id,10) === id)
    this.buttonTargets.forEach(element => {
      element.classList.remove("on")
    });
    button.classList.add("on")
    this.tabTargets.forEach(element => {
      element.classList.remove("on")
    });
    tab.classList.add("on")
  }
}
