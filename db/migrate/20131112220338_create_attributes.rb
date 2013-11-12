class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.text :key,                :null => false
      t.binary :value,            :null => false
      t.integer :enrichable_id,   :null => false
      t.string  :enrichable_type, :null => false

      t.timestamps
    end

    add_index :attributes, :key
    add_index :attributes, :enrichable_id
    add_index :attributes, :enrichable_type
  end
end
