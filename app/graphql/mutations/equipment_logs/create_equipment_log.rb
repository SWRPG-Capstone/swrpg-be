module Mutations
  module EquipmentLogs
    class CreateEquipmentLog < ::Mutations::BaseMutation
      argument :character_id, Integer, required: true
      argument :armor, String, required: true
      argument :credits, String, required: true
      argument :personal_gear, String, required: true

      type Types::EquipmentLogType

      def resolve(character_id:, **attributes)
        Character.find(character_id).create_equipment_log(attributes)
      end
    end
  end
end