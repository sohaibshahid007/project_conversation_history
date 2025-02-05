require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      project = build(:project)
      expect(project).to be_valid
    end

    it "is not valid without a title" do
      project = build(:project, title: nil)
      expect(project).not_to be_valid
      expect(project.errors[:title]).to include("can't be blank")
    end

    it "requires a unique title" do
      create(:project, title: "Unique Title")
      duplicate_project = build(:project, title: "Unique Title")

      expect(duplicate_project).not_to be_valid
      expect(duplicate_project.errors[:title]).to include("has already been taken")
    end
  end

  describe "Associations" do
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:status_changes).dependent(:destroy) }
  end
end
