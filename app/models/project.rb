class Project < ApplicationRecord
  has_many :comments
  has_many :status_changes

  enum status: { active: 0, on_hold: 1, completed: 2 }

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
