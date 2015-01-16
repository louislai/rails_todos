class AddUserToTag < ActiveRecord::Migration
  def change
    add_reference :tags, :user, index: true
    add_foreign_key :tags, :users
  end
end
