class WordsController < ApplicationController

	before_action :admin_user,    only: [:create, :destroy]

	$cur_lesson
	def new
		@word = Word.new
		@lesson = Lesson.find(params[:id])
		$cur_lesson = @lesson
	end

	def create
		@word = $cur_lesson.words.new(word_params)
		if @word.save
			flash[:success] = "Word created!"
			redirect_to lesson_path($cur_lesson.id)
		else
			flash[:danger] = "Words cannot create!"
			redirect_to lesson_path($cur_lesson.id)
		end



	end

	def destroy
		@word = Word.find(params[:id])
		@word.destroy
		flash[:success] = "Word deleted"
		redirect_to lesson_path($cur_lesson.id)
	end

	def word_params
		params.require(:word).permit(:word, :mean1, :mean2, :mean3, :mean4, :mean)
	end

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end

end
