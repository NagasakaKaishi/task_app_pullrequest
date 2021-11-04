class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(schedule_params)
      flash[:success] = "スケジュールを更新しました"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:failure] = "スケジュールを削除しました"
    redirect_to root_url
  end
  
  private
  
    def schedule_params
      params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
    end
end