class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.datetime :deadline
      t.belongs_to :tasklist, index: true
      t.timestamps null: false
    end
  end
end

