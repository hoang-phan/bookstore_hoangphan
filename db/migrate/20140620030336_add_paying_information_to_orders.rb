class AddPayingInformationToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :card_type, :string
    add_column :orders, :card_number, :string
    add_column :orders, :card_verification, :string
    add_column :orders, :card_expire_month, :integer
    add_column :orders, :card_expire_year, :integer
    add_column :orders, :ip_address, :string
  end
end
