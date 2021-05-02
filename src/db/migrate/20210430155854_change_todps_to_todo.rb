class ChangeTodpsToTodo < ActiveRecord::Migration[6.1]
  def change
    rename_table :todps, :todo
  end
end
