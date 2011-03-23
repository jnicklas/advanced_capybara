class MessagesController < ApplicationController
  def index
    @message = current_user.messages.build
    respond_to do |format|
      format.js { render :partial => 'messages.html.erb' }
      format.html { render 'index' }
    end
  end

  def new
    @reply_to = Message.find(params[:reply_to]) if params[:reply_to]
    @message = current_user.messages.build
    respond_to do |format|
      format.js { render :partial => 'form.html.erb' }
      format.html { render 'new_reply' }
    end
  end

  def create
    @message = current_user.messages.build(params[:message])

    if @message.save
      respond_to do |format|
        format.js { render :partial => 'messages.html.erb' }
        format.html { render 'index' }
      end
    else
      render "index"
    end
  end
end
