class AddColumnCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :string
    add_column :customers, :telephone_number, :string
    add_column :customers, :is_active, :boolean
    
    change_column :customers, :last_name, :string, null: false
    change_column :customers, :first_name, :string, null: false
    change_column :customers, :last_name_kana, :string, null: false
    change_column :customers, :first_name_kana, :string, null: false
    change_column :customers, :postal_code, :string, null: false
    change_column :customers, :address, :string, null: false
    change_column :customers, :telephone_number, :string, null: false
    change_column :customers, :is_active, :boolean, null: false
    
  end
end