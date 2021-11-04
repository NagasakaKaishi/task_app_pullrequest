require 'test_helper'

class SchedulesEditTest < ActionDispatch::IntegrationTest
  def setup
    @schedule = schedules(:one)
  end
  
  test "unsuccessful edit" do
    get edit_schedule_path(@schedule)
    assert_template 'schedules/edit'
    patch schedule_path(@schedule), params: { schedule: { title: " ",
                                                          start_date: " ",
                                                          end_date: " ",
                                                          all_day: " ",
                                                          memo:   " "   }  }
                                                          
    assert_template 'schedules/edit'
  end
  
  test "successful edit" do
    get edit_schedule_path(@schedule)
    assert_template 'schedules/edit'
    
    title = "title"
    start = Date.new(2021,10,13)
    finish = Date.new(2021,10,13)
    memo = "memo"
    
    patch schedule_path(@schedule), params: { schedule: { title: title,
                                                          start_date: start,
                                                          end_date: finish,
                                                          all_day: "",
                                                          memo: memo } }
    follow_redirect!
    assert_redirected_to root_path
    assert_not flash.empty?
    @schedule.reload
    assert_equal title, @schedule.title
    assert_equal start, @schedule.start_date
    assert_equal finish, @schedule.end_date
    assert_equal false, @schedule.all_day     #変更していないので変わっていないことを確認。
    assert_equal memo, @schedule.memo
  end
end