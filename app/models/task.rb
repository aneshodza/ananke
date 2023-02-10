class Task < ApplicationRecord
  attr_accessor :html_parsed_description

  belongs_to :project
  belongs_to :assigned_user, class_name: 'User', foreign_key: 'assigned_user_id',
    optional: true
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_one :project_owner, through: :project, source: :project_owner

  validates :name, presence: true
  validates :creator, presence: true
  validates :project, presence: true

  scope :finished, -> { where(finished: true) }
  scope :unfinished, -> { where(finished: false) }
end
