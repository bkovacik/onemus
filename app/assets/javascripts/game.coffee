# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

root.initCanvas = () ->
  canvas = $('#game-canvas')
  canvas.attr('width', parseInt(canvas.css('width')))
  canvas.attr('height', parseInt(canvas.css('height')))

root.initGameHandlers = () ->
  #disable right-click menu
  $('#game-canvas').on('contextmenu', (e) -> false)

  $('#game-canvas').on('mousedown', (e) -> 
    if (App.game)
      App.game.click(e)
  )
