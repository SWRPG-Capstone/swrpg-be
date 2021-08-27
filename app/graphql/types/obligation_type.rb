module Types
  class ObligationType < Types::BaseObject
    field :id, ID, null: false
    field :character_id, Integer, null: true
    field :type, String, null: true
    field :magnitude, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
