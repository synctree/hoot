class HomeController < ApplicationController

  def index
    @messages = Message.order("id DESC")
  end

  def profile
    @user = User.find_by_username(params[:username])

    @messages = @user.messages
  end

end
