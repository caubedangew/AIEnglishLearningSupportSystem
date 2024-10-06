class ExercisesController < AdminController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
    @lessons = Lesson.all
    @exercise_type = exercise_type
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
    
  end

  def edit
    @exercise = Exercise.find(params[:id])
    @lessons = Lesson.all
    @exercise_type = exercise_type
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
      params.require(:exercise).permit(:name, :exercise_type, :lesson_id)
    end

    def exercise_type
      [
        ["Multiple choice", "multiple_choice"],
        ["Fill in the blank", "blank_filling"],
        ["Translating", "translating"], 
        ["Reading", "reading"], 
        ["Speaking", "speaking"]
      ]
    end
end
