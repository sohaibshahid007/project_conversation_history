class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]

  def index
    @projects = Project.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project created successfully."
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :status)
  end
end
