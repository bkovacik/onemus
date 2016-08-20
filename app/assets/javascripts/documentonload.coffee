# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).on('load', ->
  if Cookies.get('timeout')
    setTimeout(logout, Cookies.get('timeout')*1000)

  if $('body').is('.cards.add_cards')
    switch_form('create_card_type_id')
)

# Use the controller's logout.
logout = ->
  # ajax query receives redirect data as a response
  # so we need to redirect manually
  $.ajax({
    url: '/sessions/logout'
    success: ->
      window.location.replace('/welcome/index/')
  })
