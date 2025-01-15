import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  close(event) {
    const dialog = document.getElementById(event.params.dialog);
    dialog.close();
  }

  show(event) {
    const dialog = document.getElementById(event.params.dialog);
    if (dialog) { dialog.show(); }
  }
}
