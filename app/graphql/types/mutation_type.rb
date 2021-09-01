module Types
  class MutationType < Types::BaseObject
    field :create_character, mutation: Mutations::Characters::CreateCharacter
  end
end
