class AddTaskToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :task, :string
  end
end
