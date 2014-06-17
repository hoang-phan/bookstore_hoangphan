class AddIndexToComments < ActiveRecord::Migration
  def change
    add_index :comments, [:user_id, :book_id], :unique => true
  end
end
