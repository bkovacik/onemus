# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Toggles the additional information for cards
$(document).on('click', '.card', (e) ->
  $(this).nextUntil('.card').toggle()
)

$(window).load((e) ->
  switch_form($('#create_card_type'))
)

$(document).on('change', '#create_card_type', (e) ->
  switch_form(this)
)

# Switches between the different types of forms
switch_form = (e) ->
  $('*').hide()
  $('.' + $(e).val()).show()
  $('*').not('[class]').show()

