class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :city_id,    null: false
      t.string     :municipalities
      t.string     :address
      t.string     :building
      t.string     :tel
      t.references :order,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
