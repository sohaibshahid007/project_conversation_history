class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)

    if @comment.save
      flash.now[:notice] = "Comment added successfully."
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project, notice: 'Comment added successfully.' }
      end
    else
      redirect_to @project, alert: 'Failed to add comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
