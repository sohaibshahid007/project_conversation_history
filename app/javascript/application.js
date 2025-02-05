// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
import "@popperjs/core";

document.addEventListener("turbo:frame-missing", function(event) {
  // Visit the response
  event.preventDefault()
  event.detail.visit(event.detail.response)
})
