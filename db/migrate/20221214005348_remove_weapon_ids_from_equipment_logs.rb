class RemoveWeaponIdsFromEquipmentLogs < ActiveRecord::Migration[5.2]
  def up
    remove_column :equipment_logs, :weapon_ids
  end

  def down
    add_column :equipment_logs, :weapon_ids, :integer, array: true, default: []
  end
end
