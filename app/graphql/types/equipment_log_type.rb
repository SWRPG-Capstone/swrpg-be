module Types
  class EquipmentLogType < Types::BaseObject
    field :id, ID, null: false
    field :character_id, Integer, null: true
    field :credits, String, null: true
    field :weapons, String, null: true
    field :armor, String, null: true
    field :personal_gear, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
