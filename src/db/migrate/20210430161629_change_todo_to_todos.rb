class ChangeTodoToTodos < ActiveRecord::Migration[6.1]
  def change
    rename_table :todo, :todos
  end
end
