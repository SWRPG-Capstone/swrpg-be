class ChangeWeaponsFromStringToArray < ActiveRecord::Migration[5.2]
  def self.up
    change_column :equipment_logs, :weapons, "varchar[] USING (string_to_array(weapons, ','))"
  end

  def self.down
    change_column :equipment_logs, :weapons, :string
  end
end
