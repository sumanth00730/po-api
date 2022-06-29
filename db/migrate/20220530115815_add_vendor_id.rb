class AddVendorId < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_orders , :vendor_id , :uuid
  end
end
