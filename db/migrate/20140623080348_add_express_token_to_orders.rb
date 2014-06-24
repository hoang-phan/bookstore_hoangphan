class AddExpressTokenToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :express_token, :string
    add_index :orders, :express_token, unique: true
  end
end
