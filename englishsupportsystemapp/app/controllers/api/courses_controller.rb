class Api::CoursesController < Api::ApisController
  skip_before_action :authenticate

  def index
    page = request.query_parameters["page"]

    @courses = Course.all

    auth = request.headers["Authorization"]

    if auth
      token = auth.split(" ").last
      payload = JsonWebToken.decode(token)
      if payload["user_id"]
        user = User.find(payload["user_id"])
        @courses = @courses.order(
          Arel.sql("CASE WHEN level = #{ActiveRecord::Base.sanitize_sql(user.english_level)} THEN 0 ELSE 1 END"), :level) if user
      end
    end

    @courses = @courses.limit(page_size)

    if page.present?
      @courses = @courses.offset((page.to_i - 1) * page_size)
    end

    render "api/courses/index", formats: :json
  end

  private
    def page_size
      10
    end
end
