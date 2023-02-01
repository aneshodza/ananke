class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assigned_user, class_name: 'User', foreign_key: 'assigned_user_id',
    optional: true
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  validates :name, presence: true
  validates :creator, presence: true
  validates :project, presence: true
end
