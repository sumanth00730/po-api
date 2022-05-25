class CreatePurchaseOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_orders, id: :uuid do |t|
      t.string :po_number
      t.date :delivery_date
      t.date :date
      t.text :payment_terms
      t.float :amount
      t.float :cgst
      t.float :sgst
      t.float :igst
      t.float :tds
      t.text :description
      t.timestamps
    end
  end
end
