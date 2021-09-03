module Types
  class MutationType < Types::BaseObject
    field :create_character, mutation: Mutations::Characters::CreateCharacter
    field :create_skill, mutation: Mutations::Skills::CreateSkill
    field :update_skill, mutation: Mutations::Skills::UpdateSkill
  end
end
