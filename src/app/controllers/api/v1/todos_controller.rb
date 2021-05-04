class Api::V1::TodosController < ApplicationController
    def index
        todos = Todo.where(deleted_at: 0).order(updated_at: :desc)
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
        if todo.update(todo_params)
            render json: todo
        else
            render json: { error: "Failed to destroy" } , status: 422
        end
    end

    def destroy_all
        if Todo.update_all(deleted_at: 1)
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