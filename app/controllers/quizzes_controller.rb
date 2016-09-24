class QuizzesController < ApplicationController
  
  def index
    @user = User.find(params[:id])
    @quizzes = @user.quizzes.all
  end

  def create
    @quiz = Quiz.create(quiz_params)
    @user = current_user

    if @quiz.save
      flash[:success] = "단어가 생성되었습니다!"
      redirect_to quizzes_user_path(@user)
    else
      flash[:alert] = "각 항목을 확인해주세요!"
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    @user = User.find(@quiz.user_id)
    flash[:success] = "해당 단어가 삭제되었습니다!"
    redirect_to quizzes_user_path(@user)
  end

  private

  def quiz_params
    params.require(:quiz).permit(:word, :user_id,
                                 :definition)
  end
end
