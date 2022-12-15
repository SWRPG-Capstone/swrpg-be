class EquipmentLog < ApplicationRecord
  belongs_to :character
  has_many :weapons_in_equipment_log
  has_many :weapons, through: :weapons_in_equipment_log

  validates_uniqueness_of :character_id
end
