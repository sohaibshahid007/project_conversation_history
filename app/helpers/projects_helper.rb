module ProjectsHelper
  def project_status_badge_class(project)
    case project.status
    when 'Completed'
      'bg-success'
    when 'On Hold'
      'bg-warning'
    else
      'bg-secondary'
    end
  end
end
