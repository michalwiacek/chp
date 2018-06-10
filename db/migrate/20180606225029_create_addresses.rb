class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :zip_code, null: false
      t.string :country, null: false
      t.references :addressable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
