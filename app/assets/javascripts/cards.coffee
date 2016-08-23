# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Toggles the additional information for cards
$(document).on('click', '.card', (e) ->
  $(this).nextUntil('.card').toggle()
)

# Redirects to the edit page for a certain card
$(document).on('click', '.edit_button', (e) ->
  location.replace('/cards/' + $(this).val() + '/edit')
)

$(document).on('change', '#card_type_id', (e) ->
  switch_form(this.id)
)

# Switches between the different types of forms
root = exports ? this
root.switch_form = (e) ->
  $('p').show()
  $('p').not('.' + $('#'+e+' option:selected').text().toLowerCase()).hide()
  $('p').not('[class]').show()

