module Mutations
  module Skills
    class CreateSkill < ::Mutations::BaseMutation
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
      argument :medicine, Integer, required: true
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

      def resolve(character_id:, astrogation:, athletics:, brawl:, charm:, coercion:, computers:, cool:, coordination:, core_worlds:, deception:, discipline:, education:, gunnery:, leadership:, lore:, mechanics:, medicine:, melee:, negotiation:, outer_rim:, perception:, piloting:, piloting_space:, ranged_heavy:, ranged_light:, resilience:, skulduggery:, stealth:, street_wise:, survival:, underworld:, vigilance:, xenology:)

        skills = Skill.new(character_id: character_id, astrogation: astrogation, athletics: athletics, brawl: brawl, charm: charm, coercion: coercion, computers: computers, cool: cool, coordination: coordination, core_worlds: core_worlds, deception: deception, discipline: discipline, education: education, gunnery: gunnery, leadership: leadership, lore: lore, mechanics: mechanics, medicine: medicine, melee: melee, negotiation: negotiation, outer_rim: outer_rim, perception: perception, piloting: piloting, piloting_space: piloting_space, ranged_heavy: ranged_heavy, ranged_light: ranged_light, resilience: resilience, skulduggery: skulduggery, stealth: stealth, street_wise: street_wise, survival: survival, underworld: underworld, vigilance: vigilance, xenology: xenology)

        if skills.save
          skills
        else
          {
            skills: nil,
            errors: [skills.errors.full_messages]
          }
        end
      end
    end
  end
end
