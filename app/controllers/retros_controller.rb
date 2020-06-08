class RetrosController < ApplicationController
  before_action :find_retro, only: [:show]

  def new
  end

  def create
    @retro = Retro.create(retro_params)
    redirect_to @retro
  end

  def show
  end

  private

  def retro_params
    params.require(:retro).permit(:team_id, :date)    
  end

  def find_retro
    @retro ||= Retro.find(params[:id])
  end
end
