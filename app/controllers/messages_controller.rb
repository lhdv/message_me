class MessagesController < ApplicationController
  
  def show
  end
  
  def index
  end
  
  def new
  end
  
  def create
    message = current_user.messages.build(message_params)
    if message.save
      # redirect_to root_path
      ActionCable.server.broadcast "chatroom_channel", foo: message.body
    end
  end
  
  def edit
  end
  
  def update
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end