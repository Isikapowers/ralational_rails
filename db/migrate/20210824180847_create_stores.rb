class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.boolean :open_on_weekends
      t.integer :inventory

      t.timestamps
    end
  end
end
