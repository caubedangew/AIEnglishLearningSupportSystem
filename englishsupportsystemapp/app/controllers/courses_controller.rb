class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  def new
    @course = Course.new
  end
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @course = Course.find(params[:id])
    @lessons = Lesson.where(course_id: params[:id]).all
  end
  def edit
    @course = Course.find(params[:id])
  end
  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to action: :index
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to action: :index, status: :see_other
  end

  private
    def course_params
      params.require(:course).permit(:name, :description, :level)
    end
end
