class Api::CoursesController < ApplicationController
  def index
    @level = request.query_parameters["level"]
    @page = request.query_parameters["page"]
    @courses = Course.limit(page_size)
    if @level != nil && @level != ''
      @courses = @courses.where(level: Integer(@level))
    end

    if @page != nil && @page != ''
      @courses = @courses.offset((Integer(@page) - 1) * page_size)
    end
    
    render 'api/courses/index', formats: :json
  end

  private
    def page_size
      2
    end
end