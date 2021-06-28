class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    if todo = Todo.where(project_id: params[:project_id]).find_by(todoId: params[:id])
        todo.update(isCompleted: !todo.isCompleted)
        render json: todo, status: :ok
    else render json: {errors: "task not found"}, :status => 404
    end
  end

  def create
    if project = Project.find_by(title: params[:title])
      new_todo = project.todos.new(text: params[:text],
      todoId: project.todos.size + 1)
                  
      elsif new_project = Project.new(title: params[:title], id: Project.all.size + 1)
        if new_project.save
        else return render json: {errors: new_project.errors}, status: :unprocessable_entity
        end
        new_todo = new_project.todos.new(text: params[:text], todoId: 1)
        end

      if new_todo.save
      else render json: {errors: new_todo.errors}, status: :unprocessable_entity
      end      
  end
    
    def destroy
      if todo = Todo.where(project_id: params[:project_id]).find_by(todoId: params[:id])
        todo.destroy
        project = Todo.where(project_id: params[:project_id])
        todo_id = 1
        project.each do |todo|
          todo.update(todoId: todo_id)
          todoId += 1
        end
      end
    end
end
  