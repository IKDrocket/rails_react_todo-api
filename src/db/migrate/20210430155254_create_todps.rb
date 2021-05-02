class CreateTodps < ActiveRecord::Migration[6.1]
  def change
    create_table :todps do |t|
      t.string :name, null: false
      t.boolean :is_completed, default: false, null: false

      t.timestamps
    end
  end
end
