class SolutionsController < ApplicationController
  before_action :set_solution, only: %i[update show]
  def index
    redirect_to root_path unless current_user.teacher
    @courses = Course.all
  end

  def show
    redirect_to root_path unless current_user.teacher
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @enrollment = @activity.unit.course.enrollments.find_by(student: current_user)
    @solution = Solution.new(solution_params)
    @solution.activity = @activity
    @solution.enrollment = @enrollment
    @solution.save
    redirect_to activity_path(@activity)
  end

  def update
    @solution.update(solution_params)
    redirect_to solutions_path
  end

  private

  def solution_params
    params.require(:solution).permit(:score, :file, :comment)
  end

  def set_solution
    @solution = Solution.find(params[:id])
  end
end
