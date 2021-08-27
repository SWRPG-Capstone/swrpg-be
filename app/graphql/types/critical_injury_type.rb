module Types
  class CriticalInjuryType < Types::BaseObject
    field :id, ID, null: false
    field :character_id, Integer, null: true
    field :severity, Integer, null: true
    field :result, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
