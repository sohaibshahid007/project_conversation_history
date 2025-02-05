class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy

  enum status: { active: 0, on_hold: 1, completed: 2 }

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
