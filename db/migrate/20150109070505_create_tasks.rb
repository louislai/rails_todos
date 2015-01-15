class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.datetime :deadline
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end

