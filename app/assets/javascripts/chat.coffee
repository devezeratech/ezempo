chatReady = ->
  console.debug('runnnig chatReady')
  sendChat = () ->
    console.debug("sending chat")
    $input = $("form.chat").find("input")
    socket.send $input.val()
    $input.val(null)

  $('#send-chat').click(sendChat)

  socket = new WebSocket "ws://#{window.location.host}/chat"

  socket.onmessage = (event) ->
    if event.data.length
      $('<audio id="chatAudio"><source src="audios/notify.ogg" type="audio/ogg"><source src="audios/notify.mp3" type="audio/mpeg"><source src="audios/notify.wav" type="audio/wav"></audio>').appendTo('body')
      jsonData = JSON.parse(event.data)
      $("#output").append "#{jsonData.content}"
      console.debug("received chat")
      $("#scroller").animate({"scrollTop": $('#scroller')[0].scrollHeight}, "slow")
      if jsonData.enable_notification
        $('#chatAudio')[0].play()

  $(document).on 'page:before-unload', () ->
    if socket != undefined
      socket.close()
      socket = null


  $("form.chat").on "submit", (event) ->
    event.preventDefault()
    sendChat()

$(document).on('ready', chatReady)