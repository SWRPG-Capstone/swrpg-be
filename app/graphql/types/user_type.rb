module Types
  class UserType < Types::BaseObject
    field :characters, [Types::CharacterType], null: true
    field :id, ID, null: false
    field :username, String, null: true
    field :password, String, null: true
    field :password_confirmation, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
