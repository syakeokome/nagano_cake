class RemoveIsValidFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :Is_valid, :booleangit 
  end
end
