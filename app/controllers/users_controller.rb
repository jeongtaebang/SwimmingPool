class UsersController < ApplicationController
	layout "user"

	before_action :is_admin, only: [:index]
  before_action :correct_user, only: [:show, :edit, :update]

  # For admin to view all users
  def index
    @users = User.paginate(page: params[:page])
    @user = User.find(current_user.id)
    redirect_to root_url unless current_user.admin?
  end
  
  def show
    @user = User.find(params[:id])

    # temporarily only allow user to view his or her own profile
    if !(current_user == @user)
      redirect_to root_url
    else
      respond_to do |format|
        format.html { redirect_to edit_user_path(@user) }
        format.json { render json: @user }
      end
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_with_password(user_params)
      flash[:success] = "회원정보가 수정 되었습니다!"
      redirect_to @user
    else
      flash[:alert] = "다시 한번 정보를 확인해주십시오."
      redirect_to @user
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  # To display the lectures the user has signed up for (in My Page)
  def lectures
  	@user = User.find(params[:id])
  	@allectures = Lecture.all
  	@lectures = @user.lectures.all
  	@lecture = Lecture.new

  	# when user is not signed in
  	if current_user == nil
  		redirect_to root_url
  	end
  end

  def quizzes
    @user = User.find(params[:id])
    @quizzes = @user.quizzes.all
    @quiz = Quiz.new

    # when user is not signed in
    if current_user == nil
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :password, 
      :password_confirmation, 
      :current_password
    )
  end
end
