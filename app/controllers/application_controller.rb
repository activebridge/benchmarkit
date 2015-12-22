class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
    @current_user = Account.find(session['account_id']) if session['account_id']
  rescue ActiveRecord::RecordNotFound
    reset_session
  end
  helper_method :current_user
end
