class ApplicationController < ActionController::Base
  #include PublicActivity::StoreContoller

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  rescue ActiveRecord::RecordNotFound => e
    logger.info e.to_s
    nil
  end
  helper_method :current_user

  def authorize!
    unless params[:format] == 'json'
      redirect_to root_path, alert: "You must sign in first!" and return unless current_user
    end
  end
end
