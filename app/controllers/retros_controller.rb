class RetrosController < ApplicationController
  before_action :find_retro, only: [:show]
  before_action :retro_answers, only: [:show]

  def new
  end

  def create
    @retro = Retro.new(retro_params)
    if @retro.save
      redirect_to @retro
    else
      flash[:error] = 'Retro session could not be created.'
      redirect_to new_retro_path
    end
  end

  def show
  end

  def retro_answers
    @retro_answers = @retro.answers
  end

  private

  def retro_params
    params.require(:retro).permit(:team_id, :date, :title)
  end

  def find_retro
    @retro = Retro.find(params[:retro_id])
  end
end
