class TeamsController < ApplicationController
  before_action :find_team, except: [:index]
  before_action :team_users, only: [:show, :edit]

  def index
    @user_teams = current_user.teams
  end

  def show
  end

  def edit
  end

  def update
    @team.update(team_params)
    redirect_to team_path
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end

  def add_user
    company = Company.find(@team[:company_id])
    user = company.users.find_by(email: params[:user][:email])

    if user
      @team.users << user
      redirect_back(fallback_location: edit_team_path)
    else
      # no such user in your company warning
    end
  end

  def remove_user_from_team
    relation = UserTeam.find_by(user_id: params[:user_id], team_id: @team.id)

    relation.destroy
    redirect_back(fallback_location: edit_team_path)
  end

  private

  def find_team
    @team ||= Team.find(params[:id])
  end

  def team_users
    @team_users ||= @team.users
  end

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
