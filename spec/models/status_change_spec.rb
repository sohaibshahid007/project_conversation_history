require 'rails_helper'

RSpec.describe StatusChange, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      status_change = build(:status_change)
      expect(status_change).to be_valid
    end

    it "is not valid without an old_status" do
      status_change = build(:status_change, old_status: nil)
      expect(status_change).not_to be_valid
      expect(status_change.errors[:old_status]).to include("can't be blank")
    end

    it "is not valid without a new_status" do
      status_change = build(:status_change, new_status: nil)
      expect(status_change).not_to be_valid
      expect(status_change.errors[:new_status]).to include("can't be blank")
    end

    it "is not valid without a project" do
      status_change = build(:status_change, project: nil)
      expect(status_change).not_to be_valid
      expect(status_change.errors[:project]).to include("must exist")
    end
  end

  describe "Associations" do
    it { should belong_to(:project) }
  end
end
