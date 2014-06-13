class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :order, index: true
      t.references :book, index: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
