module Types
  class CharacterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :species, String, null: true
    field :specialization, String, null: true
    field :career, String, null: true
    field :age, Integer, null: true
    field :height, String, null: true
    field :build, String, null: true
    field :hair, String, null: true
    field :eyes, String, null: true
    field :skills, [Types::SkillType], null: true
    field :weapons, [Types::WeaponType], null: true
    field :talents, [Types::TalentType], null: true
    field :equipment_logs, [Types::EquipmentLogType], null: true
    field :motivations, [Types::MotivationType], null: true
    field :obligations, [Types::ObligationType], null: true
    field :critical_injuries, [Types::CriticalInjuryType], null: true
    field :characteristics, [Types::CharacteristicType], null: true
    field :user_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
