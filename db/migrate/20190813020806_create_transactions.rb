class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :credit_card_number
      t.integer :result, default: 0
      t.references :invoice, foreign_key: true
			t.datetime :created_at, null: false
			t.datetime :updated_at, null: false
    end
  end
end
