module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    # Find single user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    # Find a list of characters for a single user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user_characters(id:)
      user = User.find(id)
      [user.characters]
    end

    # Find single character
    field :character, Types::CharacterType, null: false do
      argument :id, ID, required: true
    end

    def character(id:)
      Character.find(id)
    end

    # Find skills for a character
    field :skill, Types::SkillType, null: false do
      argument :characterId, Integer, required: true
    end

    def skill(characterId:)
      Skill.find_by(character_id: characterId)
    end

    # Find characteristics for a character
    field :characteristic, Types::CharacteristicType, null: false do
      argument :characterId, Integer, required: true
    end

    def characteristic(characterId:)
      char = Characteristic.find_by(character_id: characterId)
    end

    # Find obligations for a character
    field :obligation, Types::ObligationType, null: false do
      argument :characterId, Integer, required: true
    end

    def obligation(characterId:)
      Obligation.find_by(character_id: characterId)
    end
    
  end
end
