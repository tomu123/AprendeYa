// app/javascript/packs/application.js

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import * as bootstrap from 'bootstrap';
import '@fortawesome/fontawesome-free/js/all'
import "../../assets/stylesheets/application"
import 'bootstrap-fileinput'
import 'bootstrap-fileinput/themes/fas/theme'

var jQuery = require('jquery')

// include jQuery in global and window scope (so you can access it globally)
// in your web browser, when you type $('.div'), it is actually refering to global.$('.div')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

//Custom JS
import { activities_index_init } from "../activities/index";

document.addEventListener('turbolinks:load', () => {
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
  $(".file.video").attr("accept", "video/*");
  $(".file.document").attr("accept", ".pdf, .txt, .doc, .docx");
  $(".file.solution").attr("accept", ".pdf, .txt, .doc, .docx, image/*");
  $(".file.image").attr("accept", "image/*");
  $(".file").fileinput({ theme: "fas", showCaption: false, dropZoneEnabled: false });
  activities_index_init();
});
