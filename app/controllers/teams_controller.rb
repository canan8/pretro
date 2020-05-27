class TeamsController < ApplicationController
  def index
    @user_teams = current_user.teams
  end
end
