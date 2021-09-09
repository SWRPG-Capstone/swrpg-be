module Mutations
  module Characters
    class CreateCharacter < ::Mutations::BaseMutation
      argument :user_id, String, required: true
      argument :name, String, required: true
      argument :species, String, required: true
      argument :specialization, String, required: true
      argument :career, String, required: true
      argument :age, Integer, required: true
      argument :height, String, required: true
      argument :build, String, required: true
      argument :hair, String, required: true
      argument :eyes, String, required: true
      type Types::CharacterType

      def resolve(user_id:, name:, species:, specialization:, career:, age:, height:, build:, hair:, eyes:)

        character = Character.new(user_id: user_id, name: name, species: species, specialization: specialization, career: career, age: age, height: height, build: build, hair: hair, eyes: eyes)

        if character.save
          character
        else
          raise GraphQL::ExecutionError, character.errors.full_messages.join(", ")
        end
      end

    end
  end
end
