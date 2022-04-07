class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
    add_index :states, :code, unique: true
  end
end
