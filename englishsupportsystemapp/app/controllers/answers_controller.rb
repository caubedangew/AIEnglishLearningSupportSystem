class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to :back
    else
      render :new, status: :unprocessible_entity
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    if (@answer.update(answer_params))
      redirect_to :back
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to :back
  end
end
