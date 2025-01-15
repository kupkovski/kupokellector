import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["dialog"]

  close() {
    const closingClass = "modal-is-closing";
    const isOpenClass = "modal-is-open";
    const animationDuration = 400;
    const modal = this.dialogTarget;
    const scrollbarWidthCssVar = "--pico-scrollbar-width";

    modal.classList.add(closingClass);

    setTimeout(() => {
      modal.classList.remove(closingClass, isOpenClass);
      modal.style.removeProperty(scrollbarWidthCssVar);
      modal.close();
    }, animationDuration);
  }

  open(event) {
    debugger;
    console.log(event);
  }
}
