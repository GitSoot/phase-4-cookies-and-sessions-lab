class ApplicationController < ActionController::Base
  before_action :set_page_views

  private

  def set_page_views
    session[:page_views] ||= 0
    session[:page_views] += 1
    if session[:page_views] > 3
      render json: { error: "Maximum pageview limit reached" }, status: :unauthorized
    end
  end
end
