# which zone was the click in
clicked_zone = (x, y) ->
  return_name = ""
  $.each(window.game_draw_data['zones'], (name, zone) ->
    if x > zone['x'] and y > zone['y'] and
        x < zone['x'] + zone['width'] and
        y < zone['y'] + zone['height']
      return_name = name
    # break if conditions are met
      false
  )
  return_name

# draw box with centered text
draw_center_box = (context, x, y, width, height,
    label_width, label_height, text) ->
  context.strokeRect(x, y, width, height)
  context.fillText(text, x+(width-label_width)/2, y+(height+label_height)/2)

draw_game = (data) ->
  canvas = $('#game-canvas')[0]
  context = canvas.getContext('2d')

  window.game_draw_data = {}
  window.game_draw_data['font'] = '20px Arial'

  # have to backtick because coffeescript
  # doesn't support multiline object declares
  window.game_draw_data['zones'] = `{ hand: {}, chat: {}, deck: {}, board: {},
    phase: {}, graveyard: {}, rfp: {} }`

  # hand
  
  window.game_draw_data['zones']['hand']['width'] = 500
  window.game_draw_data['zones']['hand']['height'] = 160
  window.game_draw_data['zones']['hand']['x'] = canvas.width-
    window.game_draw_data['zones']['hand']['width']
  window.game_draw_data['zones']['hand']['y'] = canvas.height-
    window.game_draw_data['zones']['hand']['height']

  # chat
  window.game_draw_data['zones']['chat']['width'] = canvas.width-
    window.game_draw_data['zones']['hand']['width']
  window.game_draw_data['zones']['chat']['height'] = window.game_draw_data['zones']['hand']['height']
  window.game_draw_data['zones']['chat']['x'] = 0
  window.game_draw_data['zones']['chat']['y'] = window.game_draw_data['zones']['hand']['y']

  # deck
  window.game_draw_data['zones']['deck']['width'] = 160
  window.game_draw_data['zones']['deck']['height'] = 200
  window.game_draw_data['zones']['deck']['x'] = canvas.width-
    window.game_draw_data['zones']['deck']['width']
  window.game_draw_data['zones']['deck']['y'] = window.game_draw_data['zones']['hand']['y']-
   window.game_draw_data['zones']['deck']['height']

  #board
  window.game_draw_data['zones']['board']['width'] = canvas.width-
    window.game_draw_data['zones']['deck']['width']
  window.game_draw_data['zones']['board']['height'] = canvas.height-
    window.game_draw_data['zones']['hand']['height']
  window.game_draw_data['zones']['board']['x'] = 0
  window.game_draw_data['zones']['board']['y'] = 0

  #phase
  window.game_draw_data['zones']['phase']['width'] = window.game_draw_data['zones']['deck']['width']
  window.game_draw_data['zones']['phase']['height'] = 50
  window.game_draw_data['zones']['phase']['x'] = window.game_draw_data['zones']['deck']['x']
  window.game_draw_data['zones']['phase']['y'] = window.game_draw_data['zones']['deck']['y']-
   window.game_draw_data['zones']['phase']['height']

  #graveyard
  window.game_draw_data['zones']['graveyard']['width'] = window.game_draw_data['zones']['deck']['width']
  window.game_draw_data['zones']['graveyard']['height'] = 50
  window.game_draw_data['zones']['graveyard']['x'] = window.game_draw_data['zones']['phase']['x']
  window.game_draw_data['zones']['graveyard']['y'] = window.game_draw_data['zones']['phase']['y']-
   window.game_draw_data['zones']['graveyard']['height']

  #rfp
  window.game_draw_data['zones']['rfp']['width'] = window.game_draw_data['zones']['deck']['width']
  window.game_draw_data['zones']['rfp']['height'] = 50
  window.game_draw_data['zones']['rfp']['x'] = window.game_draw_data['zones']['graveyard']['x']
  window.game_draw_data['zones']['rfp']['y'] = window.game_draw_data['zones']['graveyard']['y']-
   window.game_draw_data['zones']['rfp']['height']

  context.clearRect(0, 0, canvas.width, canvas.height)
  context.font = window.game_draw_data['font']

  $.each(window.game_draw_data['zones'], (name, zone) ->
    draw_center_box(context, zone['x'], zone['y'],
      zone['width'], zone['height'],
      context.measureText(name[0].toUpperCase() + name.slice(1)).width,
      parseInt(window.game_draw_data['font']), name
    )
  )

root = exports ? this
root.createGameChannel = () ->
  # room param should always be in this location
  room = location.pathname.split('/')[2]

  App.game = App.cable.subscriptions.create { channel: "GameChannel", room: room },
    connected: ->
      draw_game({})

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log(data.message)

    ping: (data) ->
      @perform("ping", message: data)

    advance_phase: ->
      @perform("advance_phase")

    click: (data) ->
      console.log(clicked_zone(data.offsetX, data.offsetY))

root.initCanvas = () ->
  canvas = $('#game-canvas')
  canvas.attr('width', parseInt(canvas.css('width')))
  canvas.attr('height', parseInt(canvas.css('height')))
