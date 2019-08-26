class CreateComplaints < ActiveRecord::Migration[6.0]
  def change
    create_table :complaints do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :order_number
      t.integer :zip_code
      t.text :description

      t.timestamps
    end
  end
end
