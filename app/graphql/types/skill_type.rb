module Types
  class SkillType < Types::BaseObject
    field :id, ID, null: false
    field :character_id, Integer, null: true
    field :astrogation, Integer, null: true
    field :athletics, Integer, null: true
    field :charm, Integer, null: true
    field :coercion, Integer, null: true
    field :computers, Integer, null: true
    field :cool, Integer, null: true
    field :coordination, Integer, null: true
    field :deception, Integer, null: true
    field :discipline, Integer, null: true
    field :leadership, Integer, null: true
    field :mechanics, Integer, null: true
    field :medicine, Integer, null: true
    field :negotiation, Integer, null: true
    field :perception, Integer, null: true
    field :piloting, Integer, null: true
    field :piloting_space, Integer, null: true
    field :resilience, Integer, null: true
    field :skulduggery, Integer, null: true
    field :stealth, Integer, null: true
    field :street_wise, Integer, null: true
    field :survival, Integer, null: true
    field :vigilance, Integer, null: true
    field :brawl, Integer, null: true
    field :gunnery, Integer, null: true
    field :melee, Integer, null: true
    field :ranged_light, Integer, null: true
    field :ranged_heavy, Integer, null: true
    field :core_worlds, Integer, null: true
    field :education, Integer, null: true
    field :lore, Integer, null: true
    field :outer_rim, Integer, null: true
    field :underworld, Integer, null: true
    field :xenology, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
