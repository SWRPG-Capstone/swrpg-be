module Types
  class MutationType < Types::BaseObject
    field :create_characteristic, mutation: Mutations::Characteristics::CreateCharacteristic
    field :create_character, mutation: Mutations::Characters::CreateCharacter
    field :create_skill, mutation: Mutations::Skills::CreateSkill
    field :create_user, mutation: Mutations::Users::CreateUser
    field :create_weapon, mutation: Mutations::Weapons::CreateWeapon
    field :update_skill, mutation: Mutations::Skills::UpdateSkill
  end
end
