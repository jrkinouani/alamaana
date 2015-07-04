class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :price

      t.timestamps null: false
    end
  end
end
