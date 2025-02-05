require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let!(:project) { create(:project) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @projects with all projects" do
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: project.id }
      expect(response).to be_successful
    end

    it "assigns @project correctly" do
      get :show, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new project to @project" do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new project" do
        expect {
          post :create, params: { project: attributes_for(:project) }
        }.to change(Project, :count).by(1)
      end

      it "redirects to projects path" do
        post :create, params: { project: attributes_for(:project) }
        expect(response).to redirect_to(projects_path)
      end
    end

    context "with invalid attributes" do
      it "does not create a project" do
        expect {
          post :create, params: { project: attributes_for(:project, title: nil) }
        }.not_to change(Project, :count)
      end

      it "re-renders the new template" do
        post :create, params: { project: attributes_for(:project, title: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
end
