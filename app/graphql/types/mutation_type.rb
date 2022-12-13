module Types
  class MutationType < Types::BaseObject
    field :create_characteristic, mutation: Mutations::Characteristics::CreateCharacteristic
    field :create_character, mutation: Mutations::Characters::CreateCharacter
    field :create_skill, mutation: Mutations::Skills::CreateSkill
    field :create_user, mutation: Mutations::Users::CreateUser
    field :update_skill, mutation: Mutations::Skills::UpdateSkill
  end
end
