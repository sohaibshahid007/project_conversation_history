class StatusChangesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])

    old_status = @project.status
    new_status = params[:status_change][:new_status]

    @status_change = @project.status_changes.build(
      old_status: old_status.titleize,
      new_status: new_status.titleize
    )

    if @status_change.save
      @project.update(status: params[:status_change][:new_status])
      flash.now[:notice] = "Status updated successfully."

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project, notice: 'Status updated successfully.' }
      end
    else
      redirect_to @project, alert: 'Failed to update status.'
    end
  end
end
