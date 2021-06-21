class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.bigint :todo_id
      t.string :text
      t.boolean :isCompleted, default: false
      t.belongs_to :project, foreign_key: true
      
      t.timestamps
    end
  end
end
