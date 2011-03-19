class MessagesController < ApplicationController
  def index
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(params[:message])

    if @message.save
      render :partial => 'messages.html.erb'
    else
      render "index"
    end
  end
end
