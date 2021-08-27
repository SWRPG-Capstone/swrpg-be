class CreateEquipmentLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment_logs do |t|
      t.references :character, foreign_key: true
      t.string :credits
      t.string :weapons
      t.string :armor
      t.string :personal_gear

      t.timestamps
    end
  end
end
