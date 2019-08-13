class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :status, default: :shipped
      t.references :customer, foreign_key: true
      t.references :merchant, foreign_key: true
			t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
