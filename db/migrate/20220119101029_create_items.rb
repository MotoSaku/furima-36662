class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,            null: false, foreign_key: true
      t.string  :item_name,          null: false
      t.text    :overview,           null: false
      t.integer :category_id,        null: false
      t.integer :status_id,          null: false
      t.integer :charge_id,          null: false
      t.integer :city_id,            null: false
      t.integer :delivery_id,        null: false
      t.integer :price,              null: false
      t.timestamps
    end
  end
end
