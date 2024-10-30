class Users::CoursesController < UsersController
  skip_before_action :authenticate
  def index
    @page = request.query_parameters["page"] || ""
    response = fetchAPI("/courses", "get", session[:user]? true: false, { "page": @page })
    puts response
    body = JSON.parse(response.body)
    @courses = body["courses"]
    @max_page = body["max_page"]
  end

  def enroll
  end

  def show
  end
end
