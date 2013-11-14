class ChangeUidToTokenForSkins < ActiveRecord::Migration
  def change
    remove_column :skins, :uid
    add_column :skins, :token, :string
  end
end
