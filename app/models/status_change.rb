class StatusChange < ApplicationRecord
  belongs_to :project
  validates :old_status, :new_status, presence: true
end
