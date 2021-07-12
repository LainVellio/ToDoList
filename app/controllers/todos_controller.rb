class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    if todo = Todo.find(params[:id])
        todo.update(isCompleted: !todo.isCompleted)
        render json: todo, status: :ok
    else render json: {errors: "task not found"}, :status => 404
    end
  end

  def create
    project = Project.where(title: params[:title]).first_or_create 
    todo = project.todos.create(text: params[:text])
    render json: {id: project.id, title: project.title, todos: [todo]}, status: :ok
  end

end
  