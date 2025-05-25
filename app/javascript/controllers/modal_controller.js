import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    // Add click event listener to all buttons with data-modal-target
    document.querySelectorAll('[data-modal-target]').forEach(button => {
      button.addEventListener('click', () => {
        const modalId = button.getAttribute('data-modal-target')
        const modal = document.getElementById(modalId)
        modal.classList.remove('hidden')
      })
    })
  }

  close(event) {
    if (event.target === this.element) {
      this.element.classList.add('hidden')
    }
  }
} 