module Types
  class MutationType < Types::BaseObject
    # Create
    field :create_characteristic, mutation: Mutations::Characteristics::CreateCharacteristic
    field :create_character, mutation: Mutations::Characters::CreateCharacter
    field :create_equipment_log, mutation: Mutations::EquipmentLogs::CreateEquipmentLog
    field :create_skill, mutation: Mutations::Skills::CreateSkill
    field :create_talent, mutation: Mutations::Talents::CreateTalent
    field :create_user, mutation: Mutations::Users::CreateUser
    field :login_user, mutation: Mutations::Users::LoginUser

    # Update
    field :update_skill, mutation: Mutations::Skills::UpdateSkill
  end
end
