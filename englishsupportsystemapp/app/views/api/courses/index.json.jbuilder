total_courses = Course.count
page_size = 10
max_page = (total_courses.to_f / page_size).ceil

json.max_page max_page

json.courses do
  json.array!(@courses) do |course|
    json.extract! course, :id, :name, :description, :level
  end
end
