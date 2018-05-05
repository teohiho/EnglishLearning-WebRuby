module WordHelper
def current_lesson
		@current_lesson = Lesson.find_by(id: lesson_id)
	end
end
