class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: true
      t.date :date_of_birth
      t.string :phone
      t.references :address, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
