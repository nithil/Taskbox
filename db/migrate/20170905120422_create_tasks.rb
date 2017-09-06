class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :due_date
      t.boolean :is_completed, default: false
      t.integer :project_id

      t.timestamps null: false
    end
  end
end