class TeamsController < ApplicationController
  def index
    @user_teams = current_user.teams
  end

  def show
    find_team
    team_users
  end

  def edit
    find_team
    team_users
  end

  def update
    find_team.update(team_params)
    redirect_to team_path
  end

  def destroy
    find_team.destroy
    render 'index'
  end

  def remove_user_from_team
    #
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

  def team_users
    @team_users = @team.users
  end

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
