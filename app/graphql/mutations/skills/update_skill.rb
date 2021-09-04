module Mutations
  module Skills
    class UpdateSkill < ::Mutations::BaseMutation
      argument :astrogation, Integer, required: false
      argument :athletics, Integer, required: false
      argument :brawl, Integer, required: false
      argument :character_id, Integer, required: false
      argument :charm, Integer, required: false
      argument :coercion, Integer, required: false
      argument :computers, Integer, required: false
      argument :cool, Integer, required: false
      argument :coordination, Integer, required: false
      argument :core_worlds, Integer, required: false
      argument :deception, Integer, required: false
      argument :discipline, Integer, required: false
      argument :education, Integer, required: false
      argument :gunnery, Integer, required: false
      argument :id, Integer, required: false
      argument :leadership, Integer, required: false
      argument :lore, Integer, required: false
      argument :mechanics, Integer, required: false
      argument :medicine, Integer, required: false
      argument :melee, Integer, required: false
      argument :negotiation, Integer, required: false
      argument :outer_rim, Integer, required: false
      argument :perception, Integer, required: false
      argument :piloting, Integer, required: false
      argument :piloting_space, Integer, required: false
      argument :ranged_heavy, Integer, required: false
      argument :ranged_light, Integer, required: false
      argument :resilience, Integer, required: false
      argument :skulduggery, Integer, required: false
      argument :stealth, Integer, required: false
      argument :street_wise, Integer, required: false
      argument :survival, Integer, required: false
      argument :underworld, Integer, required: false
      argument :vigilance, Integer, required: false
      argument :xenology, Integer, required: false

      type Types::SkillType

      def resolve(id:, **attributes)
        Skill.find(id).tap do |skill|
          skill.update!(attributes)
        end
      end
    end
  end
end
