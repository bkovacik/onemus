# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Toggles the additional information for cards
$(document).on('click', '.card', (e) ->
  $(this).nextUntil('.card').toggle()
)

$(document).on('change', '#create_card_type_id', (e) ->
  switch_form(this.id)
)

# Switches between the different types of forms
root = exports ? this
root.switch_form = (e) ->
  $('*').not('body').hide()
  $('.' + $('#'+e+' option:selected').text().toLowerCase()).show()
  $('*').not('[class]').show()

