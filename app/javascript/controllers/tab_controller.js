import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "tab"]

  connect() {
    console.log(this.buttonTargets,this.tabTargets)
  }
  show(event){
    const button = event.currentTarget
    const id = event.params.id
    const tab = this.tabTargets.find(element => parseInt(element.dataset.id,10) === id)
    console.log(tab)
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
