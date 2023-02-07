class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :project_owner, class_name: 'User', foreign_key: 'project_owner_id'

  validates :name, presence: true, uniqueness: true
  validates :project_owner_id, presence: true
end
