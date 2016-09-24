class LecturesController < ApplicationController

	before_action :is_admin

	def create
		@lecture = Lecture.create(lecture_params)
		@user = current_user

		if @lecture.save
			flash[:success] = "Lecture created!"
			redirect_to lectures_user_path(@user)
		else
			flash[:alert] = "각 항목을 확인해주세요!"
		end
	end

	def destroy
		@lecture = Lecture.find(params[:id])
		@lecture.destroy
		# Only admin user can destroy lectures
		@user = User.find(1)
		flash[:success] = "Lecture destroyed!"
		redirect_to lectures_user_path(@user)
	end

	private

	def lecture_params
		params.require(:lecture).permit(:subject,
										:teacher,
										:content,
										:timeinfo)
	end
end
