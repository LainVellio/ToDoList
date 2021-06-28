class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    projects = Project.all
    render json: projects      
  end

  def destroy
   if project = Project.find(params[:id])
    project.destroy
    project_id = 1
    Project.all.each do |project|
      project.todos.update_all(project_id: project_id)
      project.update(id: project_id)
      project_id += 1
      end
    end
  end
end
