class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
			t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
