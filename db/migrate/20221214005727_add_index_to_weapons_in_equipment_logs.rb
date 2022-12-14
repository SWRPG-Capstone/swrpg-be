class AddIndexToWeaponsInEquipmentLogs < ActiveRecord::Migration[5.2]
  def up
    add_index :weapons_in_equipment_logs, [:weapon_id, :equipment_log_id], unique: true, name: 'weapons_in_equip_log'
  end

  def down
    remove_index :weapons_in_equipment_logs, [:weapon_id, :equipment_log_id]
  end
end
