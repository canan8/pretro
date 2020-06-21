class TeamsController < ApplicationController
  before_action :find_team, except: [:index]
  before_action :team_users, only: [:show, :edit]

  def index
  end

  def show
  end

  def edit
  end

  def update
    begin
      @team.update!(team_params)
      flash[:success] = 'Team was successfully updated.'
      redirect_to team_path
    rescue StandardError => e
      flash[:error] = 'Oops, please try again.'
      reload
    end
  end

  def destroy
    begin
      @team.destroy!
      flash[:success] = 'Team is gone forever.'
      redirect_to teams_path
    rescue StandardError => e
      flash[:error] = 'Oops, please try again.'
      reload      
    end
  end

  def add_user
    company = @team.company

    begin 
      user = company.users.find_by!(email: params[:user][:email])
      raise UserAlreadyPresentError if user.already_present?(@team)

      @team.users << user 
      flash[:success] = 'Say hi to your new team member!'
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = 'User could not been found in your company.'
    rescue UserAlreadyPresentError
      flash[:error] = "You can only have one #{user.name}."
    rescue StandardError => e
      flash[:error] = 'Oops, please try again.'
    end

    reload
  end

  def remove_user_from_team
    begin
      relation = UserTeam.find_by!(user_id: params[:user_id], team_id: @team.id)
      relation.destroy!
      flash[:success] = 'User was successfully removed. Farewell...'
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = 'User is not in the team anyway.'
    rescue StandardError => e
      flash[:error] = 'Oops, please try again.'
    end
    
    reload
  end

  private

  class UserAlreadyPresentError < StandardError; end

  def find_team
    @team = Team.find(params[:id])
  end

  def team_users
    @team_users = @team.users
  end

  def team_params
    params.require(:team).permit(:name, :description)
  end

  def reload
    redirect_back(fallback_location: edit_team_path)
  end
end
