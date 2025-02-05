require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "is not valid without content" do
      comment = build(:comment, content: nil)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include("can't be blank")
    end

    it "is not valid without a project" do
      comment = build(:comment, project: nil)
      expect(comment).not_to be_valid
      expect(comment.errors[:project]).to include("must exist")
    end
  end

  describe "Associations" do
    it { should belong_to(:project) }
  end
end
