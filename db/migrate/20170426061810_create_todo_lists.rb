class CreateTodoLists < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_lists do |t|
       t.string :title,              null: false, default: ""
        t.text :description,              null: false, default: ""
      t.timestamps
    end
  end
end
