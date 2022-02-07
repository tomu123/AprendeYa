class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :update, :destroy]
  def new
  end

  def show

  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def unit_params
    params.require(:unit).permit(:title, :description)
  end

  def set_unit
    @unit = Unit.find(params[:id])
  end
end
