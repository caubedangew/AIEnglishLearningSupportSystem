class StatsController < AdminController
  def index
    @month = request.query_parameters["month"] || Time.now.month
    @year = request.query_parameters["year"] || Time.now.year
    @stats = Course.joins(:enrollments)
                   .select("courses.id", "courses.name", "COUNT(enrollments.id) as quantity")
                   .where("EXTRACT(YEAR FROM enrollments.created_at) = ?", @year.to_i)
                   .where("EXTRACT(MONTH FROM enrollments.created_at) = ?", @month.to_i)
                   .group("courses.id", "courses.name")
  end
end
