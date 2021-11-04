class Schedule < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :start_date, presence: true
  validates :end_date, presence:true
  validates :all_day, inclusion: {in: [true, false]}
  validates :memo, length: {maximum: 100}
  validate  :end_date_is_before_start_date
  
  def end_date_is_before_start_date
    return false if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date_is_before_start_date,"終了日は今日以降の日付で選択してください")
    end
  end
end