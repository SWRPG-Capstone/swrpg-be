class CreateWeaponsInEquipmentLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons_in_equipment_logs do |t|
      t.references :weapon, foreign_key: true
      t.references :equipment_log, foreign_key: true
    end
  end
end
