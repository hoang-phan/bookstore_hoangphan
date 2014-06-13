class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.decimal :order_total_amount
      t.references :user, index: true
      t.string :shipping_address

      t.timestamps
    end
  end
end
