class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  private
  def message_params
    params.require(:meassage).permit(:content)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to '/messages'
    else
      render 'new'
    end
  end
end
