module Types
  class CharacteristicType < Types::BaseObject
    field :id, ID, null: false
    field :character_id, Integer, null: true
    field :brawn, Integer, null: true
    field :agility, Integer, null: true
    field :intellect, Integer, null: true
    field :cunning, Integer, null: true
    field :willpower, Integer, null: true
    field :presence, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
