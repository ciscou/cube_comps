class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_competition
    @competition if @competition.try(:persisted?)
  end
  helper_method :current_competition
end
