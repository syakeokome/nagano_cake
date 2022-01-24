class ChangeColumnToCustomer < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :last_name, :string
    change_column :customers, :first_name, :string
    change_column :customers, :last_name_kana, :string
    change_column :customers, :first_name_kana, :string
    change_column :customers, :postal_code, :string
    change_column :customers, :address, :string
    change_column :customers, :telephone_number, :string
  end
end
