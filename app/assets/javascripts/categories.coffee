# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.thumbinail').mouseenter ->
    $(this).find('.show-button').removeClass('hidden')

$ ->
  $('.thumbinail').mouseleave ->
    $(this).find('.show-button').addClass('hidden')