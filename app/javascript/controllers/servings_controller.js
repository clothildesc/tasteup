import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["nbServings", "quantity"];

  static values = {
    nbServings: Number
  }


  connect() {
  }

  increment() {
    const currentNbServings = this.nbServingsValue;
    this.nbServingsValue += 1;
    
    this.quantityTargets.forEach(target => {
      const quantityElement = target.querySelector('.js_quantity_value');
      let newValue = Math.round((this.nbServingsValue * (parseFloat(quantityElement.innerText) / currentNbServings))*2)/2;
      const unitElement = target.querySelector('.js_quantity_unit');
      if (unitElement.innerText == "sachet" && newValue > 1) {
        unitElement.innerText = "sachets";
      } else if (unitElement.innerText == "g" && newValue > 1000) {
        unitElement.innerText = "kg";
        newValue = Math.round((newValue / 1000),2);
      }
      quantityElement.innerText = newValue;
    });
    this.nbServingsTarget.innerText = this.nbServingsValue;
  }

  decrement() {
    if (this.nbServingsValue > 1) {
      const currentNbServings = this.nbServingsValue;
      this.nbServingsValue -= 1;

      this.quantityTargets.forEach(target => {
        const quantityElement = target.querySelector('.js_quantity_value');
        let newValue = Math.round((this.nbServingsValue * (parseFloat(quantityElement.innerText) / currentNbServings))*2)/2;
        newValue = newValue < 0 ? 0 : newValue;
        const unitElement = target.querySelector('.js_quantity_unit');
        if (unitElement.innerText == "sachets" && newValue <= 1) {
          unitElement.innerText = "sachet";
        } else if (unitElement.innerText == "kg" && newValue < 1000) {
          unitElement.innerText = "g";
          newValue = Math.round((newValue * 1000),2);
        }
        quantityElement.innerText = newValue;
      });
      this.nbServingsTarget.innerText = this.nbServingsValue;
    }
  }
}
