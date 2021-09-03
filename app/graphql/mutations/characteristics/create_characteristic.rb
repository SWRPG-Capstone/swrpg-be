module Mutations
  module Characteristics
    class CreateCharacteristic < ::Mutations::BaseMutation
      argument :agility, Integer, required: true
      argument :brawn, Integer, required: true
      argument :character_id, Integer, required: true
      argument :char_presence, Integer, required: true
      argument :cunning, Integer, required: true
      argument :id, ID, required: true
      argument :intellect, Integer, required: true
      argument :willpower, Integer, required: true

      type Types::CharacteristicType

      def resolve(character_id:, **attributes)
        Character.find(character_id).characteristics.create!(attributes)
      end
    end
  end
end
