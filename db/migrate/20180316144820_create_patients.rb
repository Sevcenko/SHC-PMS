class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.date :birthday
      t.integer :addressNumber
      t.text :address_street
      t.string :city
      t.text :phoneNumber
      t.string :clinic

      t.timestamps
    end
  end
end
