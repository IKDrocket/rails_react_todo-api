class Api::V1::TodosController < ApplicationController
    require "date"

    def index
        todos = Todo.where(deleted_at: nil).order(created_at: :desc)
        render json: todos
    end

    def show
        todo = Todo.find(params[:id])
        render json: todo
    end

    def create
        todo = Todo.new(todo_params)
        if todo.save
            render json: todo
        else
            render json: todo.errors, status: 422
        end
    end
    def update
        todo = Todo.find(params[:id])
        if todo.update(todo_params)
            render json: todo
        else
            render json: todo.errors, status: 422
        end
    end
    
    def destroy
        todo = Todo.find(params[:id])
        if todo.update(todo_params)
            render json: todo
        else
            render json: { error: "Failed to destroy" } , status: 422
        end
    end

    def destroy_all
        todos = Todo.where(deleted_at: nil)
        if todos.update_all(deleted_at: DateTime.now)
            head :no_content
        else
            render json: { error: "Failed to destroy" } , status: 422
        end
    end

    private
    def todo_params
        params.require(:todo).permit(:name, :is_completed, :deleted_at)
    end
end