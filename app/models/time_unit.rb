class TimeUnit < ApplicationRecord
  belongs_to :user
  belongs_to :task, optional: true

  validates :start_time, presence: true
  validate :end_time_after_start_time, if: :end_time
  validates :user, presence: true
  validates :task, presence: true, if: :end_time
  validates :description, presence: true, if: :end_time

  scope :my_ended_time, ->(user) { where(user: user).where.not(end_time: nil) }

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, 'must be after the start time') if end_time < start_time
  end
end
