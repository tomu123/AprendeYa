class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
    @solutions = Solution.all
    @users = User.all
  end

  def create
    @enrollment = Enrollment.create(course_id: params[:course_id], student: current_user)
    redirect_to course_path(params[:course_id])
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:final_grade)
  end
end
