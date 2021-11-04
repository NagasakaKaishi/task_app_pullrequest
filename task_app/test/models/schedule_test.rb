require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  def setup
    @schedule = Schedule.new(title: "午後から出社", start_date: "2021-10-14", end_date: "2021-10-15", all_day: true, memo: "ワクチン接種")
  end
  
  test "should be valid" do
    assert @schedule.valid?
  end
  
  test "title should be present" do
    @schedule.title = "  "
    assert_not @schedule.valid?
  end
  
  test "start_date should be present" do
    @schedule.start_date = "  "
    assert_not @schedule.valid?
  end
  
  test "end_date should be present" do
    @schedule.end_date = "  "
    assert_not @schedule.valid?
  end
  
  test "all_day should be present" do
    @schedule.all_day = nil
    assert_not @schedule.valid?
  end
  
  test "title should be maximum 50" do
    @schedule.title = "a" * 51
    assert_not @schedule.valid?
  end
  
  test "memo should be maximum 100" do
    @schedule.memo = "a" * 101
    assert_not @schedule.valid?
  end
  
  test "start_date should be before end_date" do
    @schedule.end_date = Date.new(2021,10,13)
    assert_not @schedule.valid?
  end
  
end