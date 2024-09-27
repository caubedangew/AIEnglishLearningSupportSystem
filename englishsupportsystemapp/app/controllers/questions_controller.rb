class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save
      redirect_to :back
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @answers = Answer.where(question_id: params[:id]).all
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      redirect_to :back
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to 
  end
end
