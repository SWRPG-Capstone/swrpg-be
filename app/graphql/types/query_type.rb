module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :character, Types::CharacterType, null: false do
      argument :id, ID, required: true
    end

    def character(id:)
      Character.find(id)
    end

    field :skill, Types::SkillType, null: false do
      argument :characterId, Integer, required: true
    end

    def skill(characterId:)
      Skill.find_by(character_id: characterId)

    field :characteristic, Types::CharacteristicType, null: false do
      argument :characterId, Integer, required: true
    end

    def characteristic(characterId:)
      char = Characteristic.find_by(character_id: characterId)
    end
  end
end
