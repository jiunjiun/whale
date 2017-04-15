# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require Polo/vender/jquery-1.11.2.min
#= require jquery_ujs
#= require Polo/vender/plugins-compressed
#= require Polo/theme-functions
#= require Polo/custom

$('.shark_carousel').owlCarousel
  items: 1
  loop: true
  nav: true
  margin:10
  autoHeight: true
  video: true
  pagination: false
  navText: [
    '<i class="fa fa-arrow-left icon-white"></i>',
    '<i class="fa fa-arrow-right icon-white"></i>'
  ]
  dotsClass: false
