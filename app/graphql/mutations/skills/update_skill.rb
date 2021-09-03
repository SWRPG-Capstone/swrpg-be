module Mutations
  module Skills
    class UpdateSkill < ::Mutations::BaseMutation
      argument :id, Integer, required: true
      argument :character_id, Integer, required: true
      argument :astrogation, Integer, required: true
      argument :athletics, Integer, required: true
      argument :brawl, Integer, required: true
      argument :charm, Integer, required: true
      argument :coercion, Integer, required: true
      argument :computers, Integer, required: true
      argument :cool, Integer, required: true
      argument :coordination, Integer, required: true
      argument :core_worlds, Integer, required: true
      argument :deception, Integer, required: true
      argument :discipline, Integer, required: true
      argument :education, Integer, required: true
      argument :gunnery, Integer, required: true
      argument :leadership, Integer, required: true
      argument :lore, Integer, required: true
      argument :mechanics, Integer, required: true
      argument :melee, Integer, required: true
      argument :negotiation, Integer, required: true
      argument :outer_rim, Integer, required: true
      argument :perception, Integer, required: true
      argument :piloting, Integer, required: true
      argument :piloting_space, Integer, required: true
      argument :ranged_heavy, Integer, required: true
      argument :ranged_light, Integer, required: true
      argument :resilience, Integer, required: true
      argument :skulduggery, Integer, required: true
      argument :stealth, Integer, required: true
      argument :street_wise, Integer, required: true
      argument :survival, Integer, required: true
      argument :underworld, Integer, required: true
      argument :vigilance, Integer, required: true
      argument :xenology, Integer, required: true

      type Types::SkillType

      def resolve(id:, **attributes)
        Skill.find(id).tap do |skill|
          require 'pry'; binding.pry

          skill.update!(attributes)
        end
      end

      # def resolve(id:, skill:, amount_changed:)
      #   Character.find(character_id).tap do |character|
      #     require 'pry'; binding.pry
      #
      #     skill_current_level = character.skills.skill
      #     character.skills.update!(skill_current_level += amount_changed)
      #   end
      # end

    end
  end
end
