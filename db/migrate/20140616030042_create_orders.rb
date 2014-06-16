class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date, default: Time.now
      t.decimal :order_total_amount
      t.references :user, index: true
      t.string :shipping_address, default: "unknown"

      t.timestamps
    end
  end
end
