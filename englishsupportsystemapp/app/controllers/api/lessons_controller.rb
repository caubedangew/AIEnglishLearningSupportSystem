class Api::LessonsController < ApplicationController
  def index
    @level = request.query_parameters["level"]
    @page = request.query_parameters["page"]
    @lessons = Course.limit(page_size)
    if @level != nil && @level != ''
      @lessons = @lessons.where(level: Integer(@level))
    end

    if @page != nil && @page != ''
      @lessons = @lessons.offset((Integer(@page) - 1) * page_size)
    end
    
    render 'api/lessons/index', formats: :json
  end

  private
    def page_size
      2
    end
end