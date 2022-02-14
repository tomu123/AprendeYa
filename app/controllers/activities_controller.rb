class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show update destroy]

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.unit = Unit.find(params[:unit_id])
    if @activity.valid?
      @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def get_by_type
    if Activity.activity_types.keys.include?(params[:type])
      @activities = Activity.where(activity_type: params[:type], unit: params[:unit_id])
    else
      @activities = []
    end
  end

  def show
    @solution = @activity.solutions.joins(:enrollment).find_by(enrollment: { student: current_user })
    @done = @solution.blank?
    @solution ||= Solution.new
  end

  def update
  end

  def index
    redirect_to new_unit_activity_path(params[:unit_id])
  end

  def edit
  end

  def destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :file, :activity_type)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
