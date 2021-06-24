class CreateTodos < ActiveRecord::Migration[6.1]
  def change
      create_table :todos do |t|
      t.bigint :todoId
      t.string :text
      t.boolean :isCompleted, default: false
      t.belongs_to :project
      
      t.timestamps
    end
  end
end
