class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :doctor
      t.text :reason
      t.text :diagnosis
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
