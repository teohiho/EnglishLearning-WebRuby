class LessonController < ApplicationController


  before_action :admin_user,     only: :create



  $lesson_id


  def new
    @lesson = Lesson.new
  end 

  def create
    @lesson =  Lesson.new(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson created!"
      redirect_to root_url
    else
     render 'lesson/new'
   end
 end



def destroy
    Lesson.find(params[:id]).destroy
    redirect_to root_url
end


def lesson_params
  params.require(:lesson).permit(:id, :name)
end


def show
  @lesson = Lesson.find(params[:id])
  $lesson_id = @lesson.id
  @words = @lesson.words.paginate(page: params[:page])
end

def quiz
  @lesson = Lesson.find($lesson_id)
  @words = @lesson.words.paginate(page: params[:page])


  answer = []
  answer =Word.pluck(:mean)
  @answer = Word.pluck(:mean)
end	


  def submit
    @message = "I am here!!!"

    words = [[]]
    words =Word.where("lesson_id like ? ",$lesson_id ).pluck(:mean1, :mean2, :mean3, :mean4, :word)
    @words = words
    means = []
    means =Word.where("lesson_id like ? ",$lesson_id ).pluck(:mean)
    @means = means

    correct_id = []
    correct_words = []
    correct_means = []
    for i in 0..means.length-1
      for j in 0..3
        if means[i] == words[i][j]
           correct_id.push((j+1).to_s)
           correct_words.push(words[i][4])
           correct_means.push(means[i])
        end
      end
    end
    # @correct_id =  correct_id
    # @correct_words =  correct_words
    # @correct_means =  correct_means



    # Bắt params bên form view
    # i= $lesson_id

    list_answer = {}
    list_answer = params{:answer[i]}


    # Câu trả lời của bạn

    answer = []
    for i in 1..means.length
      answer.push(list_answer["answer" + i.to_s])
    end
    @answer = answer #1,2,3,4

    #Số câu bạn trả lời đúng
    socaudung = 0
   
    for i in 0..means.length-1
      if correct_id[i] == answer[i]
        Wordlist.create(content: correct_words[i], user_id: current_user.id, mean: correct_means[i]) 
        # @correct_words = correct_words[i]
        # @correct_means = correct_means[i]
        socaudung = socaudung + 1
      end
    end 
    @message = socaudung.to_s   
  end   
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
