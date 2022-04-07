class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :code
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cities, :code, unique: true
  end
end
