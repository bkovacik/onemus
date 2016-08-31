root = exports ? this
root.createGameChannel = () ->
  # room param should always be in this location
  room = location.pathname.split('/')[2]

  App.game = App.cable.subscriptions.create { channel: "GameChannel", room: room },
    connected: ->

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log(data.message)

    ping: ->
      @perform("ping")
