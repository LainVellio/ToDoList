class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    if todo = Todo.where(project_id: params[:project_id]).find_by(todo_id: params[:id])
        todo.update(isCompleted: !todo.isCompleted)
        render json: todo, status: :ok
    else render json: {errors: "bad request"}, status: :unprocessable_entity
    end
  end

  def create
    if project = Project.find_by(title: params[:title])
      new_todo = project.todos.new(text: params[:text],
      todo_id: project.todos.size + 1)
                  
      elsif new_project = Project.new(title: params[:title])
        if new_project.save
        else return render json: {errors: new_project.errors}, status: :unprocessable_entity
        end
        new_todo = new_project.todos.new(text: params[:text], todo_id: 1)
        end

      if new_todo.save
      else render json: {errors: new_todo.errors}, status: :unprocessable_entity
      end
    end
end
  