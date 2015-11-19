chatReady = ->
  console.debug('runnnig chatReady')
  # $("#scroller").animate({"scrollTop": $('#scroller')[0].scrollHeight}, "slow")
  wrapper = $('.page-quick-sidebar-wrapper');
  wrapperChat = wrapper.find('.page-quick-sidebar-chat');
  chatContainer = wrapperChat.find(".page-quick-sidebar-chat-user-messages");
  input = wrapperChat.find('.page-quick-sidebar-chat-user-form .form-control');
  chatContainer.slimScroll({
    scrollTo: '1000000px'
  });
  
  sendChat = () ->
    if input.val() != ""
      console.debug("sending chat") 
      socket.send input.val()
      input.val('')

  $('#send-chat').click(sendChat)
  $('#chat_input').on 'keypress', (e) ->
    if e.which == 13 
        sendChat();
        return false;

  socket = new WebSocket "ws://#{window.location.host}/chat"

  socket.onmessage = (event) ->
    if event.data.length
      $('<audio id="chatAudio"><source src="/audios/notify.ogg" type="audio/ogg"><source src="/audios/notify.mp3" type="audio/mpeg"><source src="/audios/notify.wav" type="audio/wav"></audio>').appendTo('body')
      jsonData = JSON.parse(event.data)
      $("#chat-output").append "#{jsonData.content}"
      console.debug("received chat")
      chatContainer.slimScroll({
        scrollTo: '1000000px'
      });
      # $("#scroller").animate({"scrollTop": $('#scroller')[0].scrollHeight}, "slow")
      $("#chat_input").focus()

      if jsonData.enable_notification
        $('#chatAudio')[0].play()
        $("#chat-output li").last().effect("shake", "slow")

  $(document).on 'page:before-unload', () ->
    if socket != undefined
      socket.close()
      socket = null


  $("form.chat").on "submit", (event) ->
    event.preventDefault()
    sendChat()

$(document).on('ready', chatReady)