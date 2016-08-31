# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).on('load', ->
  if Cookies.get('timeout')
    setTimeout(logout, Cookies.get('timeout')*1000)

  if $('body').is('.cards')
    if $('body').is('.edit, .new')
      switch_form('card_type_id')
  else if $('body').is('.game')
    if !$('body').is('.index')
      initSocket()
      createGameChannel()
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
