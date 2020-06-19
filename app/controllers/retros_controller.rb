class RetrosController < ApplicationController
  before_action :find_retro, only: [:show]

  def new
  end

  def create
    @retro = Retro.new(retro_params)
    if @retro.save!
      redirect_to @retro
    else
      flash[:error] = 'Retro session could not be created.' # this cant be displayed, fix it
      redirect_to new_retro_path
    end
  end

  def show
  end

  private

  def retro_params
    params.require(:retro).permit(:team_id, :date)    
  end

  def find_retro
    @retro = Retro.find(params[:id])
  end
end
