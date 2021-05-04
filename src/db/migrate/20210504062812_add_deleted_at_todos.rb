class AddDeletedAtTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :deleted_at, :boolean, default: false, null: false
  end
end
