class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :load_recent_chat

  private

  def load_recent_chat
    @chats = Chat.last(10)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."

    redirect_to(request.referrer || root_path )
  end
end
