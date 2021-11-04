module SchedulesHelper
  def all_day_check
    if @schedule.all_day?
      check = "◯"
      check
    elsif @schedule.all_day?
      check = ""
      check
    end
  end
end