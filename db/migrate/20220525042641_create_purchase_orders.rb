class CreatePurchaseOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_orders, id: :uuid do |t|
      t.string :po_number
      t.string :owner_name
      t.string :vendor_name
      t.date :date
      t.date :expected_date
      t.float :amount
      t.string :status
      t.timestamps
    end
  end
end
