class Api::LessonsController < Api::ApisController
  def index
    @level = request.query_parameters["level"]
    @page = request.query_parameters["page"]
    @course = request.query_parameters["course_id"]
    @lessons = Course.limit(page_size)
    if @level.present?
      @lessons = @lessons.where(level: @level.to_i)
    end

    if @course.present?
      @lessons = @lessons.where(course_id: @course.to_i)
    end

    if @page.present?
      @lessons = @lessons.offset((@page.to_i - 1) * page_size)
    end

    render "api/lessons/index", formats: :json
  end

  private
    def page_size
      10
    end
end
