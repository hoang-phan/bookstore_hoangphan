class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author_name
      t.string :publisher_name
      t.date :published_date
      t.decimal :unit_price
      t.string :photo

      t.timestamps
    end
  end
end
