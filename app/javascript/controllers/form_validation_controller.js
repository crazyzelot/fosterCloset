import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "category", "submit"]

  connect() {
    this.validateForm()
  }

  validateForm() {
    const category = this.categoryTarget.value.trim()
    const isValid = category.length > 0

    this.submitTarget.disabled = !isValid
    this.submitTarget.classList.toggle("opacity-50", !isValid)
    this.submitTarget.classList.toggle("cursor-not-allowed", !isValid)
    
    if (!isValid) {
      this.categoryTarget.classList.add("border-red-300")
    } else {
      this.categoryTarget.classList.remove("border-red-300")
    }
  }

  validateOnInput() {
    this.validateForm()
  }
} 