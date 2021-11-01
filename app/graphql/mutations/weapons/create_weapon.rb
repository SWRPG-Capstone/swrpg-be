module Mutations
  module Weapons
    class CreateWeapon < ::Mutations::BaseMutation
      argument :character_id, Integer, required: true 
      argument :skill, String, required: true
      argument :special, String, required: true
      argument :damage, Integer, required: true
      argument :range, Integer, required: true
      argument :critical, Integer, required: true

      type Types::WeaponType
      field :errors, [String], null:false

      def resolve(character_id:, skill:, special:, damage:, range:, critical:)
        weapon = Weapon.new(character_id: character_id, skill: skill, special: special, damage: damage, range: range, critical: critical)

        if weapon.save
          weapon
        else
          {
            weapon: nil,
            errors: [weapon.errors.full_messages]
          }
        end
      end
    end
  end
end

