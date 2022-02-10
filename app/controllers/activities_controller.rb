class ActivitiesController < ApplicationController
  def new
  end

  def create
  end

  def get_by_type
    if Activity.activity_types.keys.include?(params[:type])
      @activities = Activity.where(activity_type: params[:type], unit: params[:unit_id])
    else
      @activities = []
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @solution = @activity.solutions.joins(:enrollment).find_by(enrollment: { student: current_user })
    @done = @solution.blank?
    @solution ||= Solution.new
  end

  def index
    @units = Unit.all
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
