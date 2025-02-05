require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:project) { create(:project) }
  let!(:comment) { create(:comment, project: project) }

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new comment" do
        expect {
          post :create, params: { project_id: project.id, comment: attributes_for(:comment) }
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the project show page" do
        post :create, params: { project_id: project.id, comment: attributes_for(:comment) }
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid attributes" do
      it "does not create a comment" do
        expect {
          post :create, params: { project_id: project.id, comment: attributes_for(:comment, content: nil) }
        }.not_to change(Comment, :count)
      end

      it "re-renders the project show template" do
        post :create, params: { project_id: project.id, comment: attributes_for(:comment, content: nil) }
        expect(response).to redirect_to(project)
      end
    end
  end
end
