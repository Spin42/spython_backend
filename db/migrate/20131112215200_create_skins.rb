class CreateSkins < ActiveRecord::Migration
  def change
    create_table :skins do |t|
      t.string :uid, :null => false

      t.timestamps
    end

    add_index :skins, :uid
  end
end
