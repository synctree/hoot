class HomeController < ApplicationController

  def index
    if user_signed_in? && current_user.followings.count > 0
      @messages = current_user.interesting_messages
    else
      @messages = Message
    end

    @message = @messages.order("id DESC")
  end

  def profile
    @user = User.find_by_username(params[:username]) or raise ActiveRecord::RecordNotFound
    @messages = @user.messages
  end

  def search
    @messages = Message.where("body LIKE ?", "%#{params[:q]}%") if params[:q]
  end

end
