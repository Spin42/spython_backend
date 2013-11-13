class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :key,              :null => false
      t.string :type,             :null => false
      t.text   :value,            :null => false, limit: 8.megabytes
      t.integer :enrichable_id,   :null => false
      t.string  :enrichable_type, :null => false

      t.timestamps
    end

    add_index :properties, :key
    add_index :properties, :type
    add_index :properties, :enrichable_id
    add_index :properties, :enrichable_type
  end
end
