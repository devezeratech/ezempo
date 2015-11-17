class ChatController < ApplicationController
  include Tubesock::Hijack
  include EmojiHelper

  def chat
    # hijack do |tubesock|
    #   tubesock.onopen do
    #     tubesock.send_data "Hello, friend"
    #   end

    #   tubesock.onmessage do |data|
    #     tubesock.send_data "You said: #{data}"
    #   end
    # end
    hijack do |tubesock|
      # Listen on its own thread
      redis_thread = Thread.new do
        # Needs its own redis connection to pub
        # and sub at the same time
        Redis.new.subscribe "chat" do |on|
          on.message do |channel, message|
            json_data = JSON.parse(message)
            user = User.find(json_data['user_id'])
            to_send = { enable_notification: (user != current_user), 
                        content: render_to_string(partial: 'chat_message', locals: { user: user, message: json_data['message'], time: json_data['time'] })
                      }.to_json
            tubesock.send_data(to_send)
          end
        end
      end

      tubesock.onmessage do |m|
        # pub the message when we get one
        # note: this echoes through the sub above
        Redis.new.publish "chat", { user_id: current_user.id, message: m, time: DateTime.now }.to_json if m.present?
      end
      
      tubesock.onclose do
        # stop listening when client leaves
        redis_thread.kill
      end
    end
  end
end