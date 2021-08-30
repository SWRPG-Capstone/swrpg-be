class Mutation::UpdateSkill < Mutations::BaseMutation

  # argument
  #
  # field

  def resolve(character_id:, skill:, amount_changed:)
    character = Character.find(character_id)
    skill_current_level = character.skills.skill
    update = character.skills.update(skill: (skill_current_level += amount_changed)
  end
end
