class AnswersController < AdminController
  def index
    @exercise_id = params[:exercise_id]
    @question_id = params[:question_id]
    @answers = Answer.where(question_id: @question_id).all
  end

  def new
    @answer = Answer.new
    @exercise_id = params[:exercise_id]
    @question_id = params[:question_id]
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]

    if @answer.save
      redirect_to exercise_question_answers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @exercise_id = params[:exercise_id]
    @question_id = params[:question_id]
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    if (@answer.update(answer_params))
      redirect_to exercise_question_answers
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to :back
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :is_correct)
    end
end
