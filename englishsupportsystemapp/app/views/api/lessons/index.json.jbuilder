json.array!(@lesson) do |lesson|
  json.extract! lesson, :id, :name, :content
  json.course lesson.course.id
end