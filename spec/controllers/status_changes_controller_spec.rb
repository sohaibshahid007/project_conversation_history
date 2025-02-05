require 'rails_helper'

RSpec.describe StatusChangesController, type: :controller do
  let!(:project) { create(:project) }
  let!(:status_change) { create(:status_change, project: project) }

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new status change" do
        expect {
          post :create, params: { project_id: project.id, status_change: attributes_for(:status_change) }
        }.to change(StatusChange, :count).by(1)
      end

      it "redirects to the project show page" do
        post :create, params: { project_id: project.id, status_change: attributes_for(:status_change) }
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid attributes" do
      it "does not create a status change" do
        expect {
          post :create, params: { project_id: project.id, status_change: attributes_for(:status_change, new_status: nil) }
        }.not_to change(StatusChange, :count)
      end

      it "re-renders the project show template" do
        post :create, params: { project_id: project.id, status_change: attributes_for(:status_change, new_status: nil) }
        expect(response).to redirect_to(project)
      end
    end
  end
end
