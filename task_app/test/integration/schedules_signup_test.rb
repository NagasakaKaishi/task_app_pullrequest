require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    get signup_path
    assert_difference 'Schedule.count', 1 do
      post schedules_path, params: { schedule: { title:  "Example User",
                                         start_date: Date.new(2021,10,13),
                                         end_date:   Date.new(2021,10,13),
                                         all_day:    true,
                                         memo:       "memo" } }
    end
    follow_redirect!
    assert_template root_path
  end
end