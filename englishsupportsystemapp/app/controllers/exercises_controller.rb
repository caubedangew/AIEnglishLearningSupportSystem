class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
    @lessons = Lesson.all
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      redirect_to action: :index
    else
      @lessons = Lesson.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @questions = Question.where(exercise_id: params[:id]).all
  end

  def edit
    @exercise = Exercise.find(params[:id])
    @lessons = Lesson.all
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(exercise_params)
      redirect_to action: :index
    else
      @lessons = Lesson.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    redirect_to action: :index, status: :see_other
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, :type, :lesson_id)
    end
end
