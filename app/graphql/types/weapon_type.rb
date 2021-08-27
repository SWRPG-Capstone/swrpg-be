module Types
  class WeaponType < Types::BaseObject
    field :id, ID, null: false
    field :character_id, Integer, null: true
    field :skill, String, null: true
    field :special, String, null: true
    field :damage, Integer, null: true
    field :range, Integer, null: true
    field :critical, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
