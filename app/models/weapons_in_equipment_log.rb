class WeaponsInEquipmentLog < ApplicationRecord
    belongs_to :weapon
    belongs_to :equipment_log
end