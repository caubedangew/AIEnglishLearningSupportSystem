class QuestionsController < AdminController
  def index
    @questions = Question.where(exercise_id: params[:exercise_id]).all
    @exercise_id = params[:exercise_id]
  end

  def new
    @question = Question.new
    @exercise_id = params[:exercise_id]
  end

  def create
    @question = Question.new(question_params)
    @question.exercise_id = params[:exercise_id]
    
    if @question.save
      redirect_to exercise_questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @answers = Answer.where(question_id: params[:id]).all
  end

  def edit
    @question = Question.find(params[:id])
    @exercise_id = params[:exercise_id]
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to exercise_questions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to exercise_questions_path
  end

  private
    def question_params
      params.require(:question).permit(:name)
    end
end
