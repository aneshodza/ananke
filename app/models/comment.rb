class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :user, presence: true
  validates :task, presence: true
  validates :content, presence: true
end
