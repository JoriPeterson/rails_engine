class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.float :unit_price
      t.references :item, foreign_key: true
      t.references :invoice, foreign_key: true
			t.datetime :created_at, null: false
			t.datetime :updated_at, null: false
    end
  end
end
