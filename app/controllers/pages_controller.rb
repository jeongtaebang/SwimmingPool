class PagesController < ApplicationController
  def home
  end

  def lecture
    @user = current_user
		@lectures = Lecture.all
		@lecture_hash = Hash.new
		@lectures.each_with_index {|lecture, index|
			@lecture_hash[index] = lecture
		}
  end

  def study
  	@user = current_user
    if !@user.nil?
      @quizzes = @user.quizzes.all
      @quiz_hash = Hash.new
      @quizzes.each_with_index {|quiz, index|
      	@quiz_hash[index] = quiz
      }
    end
  end
end
