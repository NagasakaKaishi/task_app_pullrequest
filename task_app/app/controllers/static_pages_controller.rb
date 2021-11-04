class StaticPagesController < ApplicationController
  def home
    @schedules = Schedule.all
    # @schedule = Schedule.find(params[:id])
  end
end
