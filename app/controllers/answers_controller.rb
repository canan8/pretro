class AnswersController < ApplicationController
  before_action :find_retro, only: [:new, :create, :edit, :destroy]

  def new
    @answer = Answer.new(params[:answer])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.retro_id = params[:retro_id]

    if @answer.save
      flash[:success] = 'Answer was successfully submitted.'
      redirect_to @retro
    else
      flash[:error] = 'There was an error submitting the answer.'
    end
  end

  def update
    @answer = Answer.find(params[:answer_id])
    @retro = @answer.retro

    if @answer.update(answer_params) 
      flash[:success] = 'Answer was successfully submitted.'
      redirect_to @retro
    else
      flash[:error] = 'There was an error submitting the answer.'
    end
  end

  def edit
    @answer = Answer.find(params[:answer_id])
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @answer.destroy
    redirect_to @retro
  end

  def answer_params
    params.require(:answer).permit(
      :rating,
      entries_attributes: [:id, :answer_id, :detail, :entry_type, :_destroy]
    )
  end

  def entry_params
    params.require(:entry).permit(:detail)
  end

  def find_retro
    @retro = Retro.find(params[:retro_id])
  end
end
