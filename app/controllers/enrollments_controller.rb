class EnrollmentsController < ApplicationController
  def create
  	@enrollment = Enrollment.create(user_id: params[:user_id], lecture_id: params[:lecture_id])

		@enrollment.save
		flash[:success] = "등록되었습니다!"
		redirect_to "/lecture"
  end

  def destroy
  	@enrollment = Enrollment.find_by(user_id: params[:user_id], lecture_id: params[:lecture_id])
  	@enrollment.destroy
  	flash[:success] = "취소되었습니다"
  	redirect_to "/lecture"
  end
end
