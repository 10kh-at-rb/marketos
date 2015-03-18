# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('form').on 'click', '.remove_image', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).parent('div').hide()
    event.preventDefault

$ ->
  $('a.cboxElement').colorbox({
    rel: 'cboxElement',
    width: "70%"
    });