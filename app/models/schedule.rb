class Schedule < ApplicationRecord

  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }

  validate :end_after_start

  def end_after_start
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "は開始日以降にしてください")
    end
  end

end