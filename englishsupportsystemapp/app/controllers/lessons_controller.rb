class LessonsController < AdminController
  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
    @courses = Course.all
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to action: :index
    else
      @courses = Course.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    @courses = Course.all
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update(lesson_params)
      redirect_to action: :index
    else
      @courses = Course.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    redirect_to action: :index, status: :see_other
  end

  private
    def lesson_params
      params.require(:lesson).permit(:name, :content, :course_id)
    end
end
