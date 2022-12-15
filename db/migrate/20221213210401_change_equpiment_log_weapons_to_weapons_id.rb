class ChangeEqupimentLogWeaponsToWeaponsId < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :equipment_logs, :weapons, :weapon_ids
  end

  def self.down
    rename_column :equipment_logs, :weapon_ids, :weapons
  end
end
