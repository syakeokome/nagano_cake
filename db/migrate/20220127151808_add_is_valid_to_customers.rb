class AddIsValidToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Is_valid, :boolean, default: true, null: false
  end
end
