class CreateBookCategoryItems < ActiveRecord::Migration
  def change
    create_table :book_category_items do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps
    end

    add_index :book_category_items, [:book_id, :category_id], unique: true
  end
end
