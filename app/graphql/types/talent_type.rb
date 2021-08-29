module Types
  class TalentType < Types::BaseObject
    field :id, ID, null: false
    field :character_id, Integer, null: true
    field :name, String, null: true
    field :page_number, Integer, null: true
    field :ability_summary, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
