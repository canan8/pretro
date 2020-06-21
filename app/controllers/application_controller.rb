class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user_teams

  def current_user_teams
    current_user.teams
  end
end
