class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    Survey.where("? = ANY(token)", params[:token]).exists? if params[:token]
  end

  def render_unauthorized
    render json: 'Você não está autorizado a acessar essa página', status: 401
  end
end
