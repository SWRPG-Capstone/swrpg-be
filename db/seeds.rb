User.destroy_all
Character.destroy_all

5.times do
  User.create(username: Faker::Name.name)
end

5.times do
  user = User.all.first
  character = user.characters.create(name: Faker::Name.name, species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)

      character.characteristics.create(
      brawn: Faker::Number.within(range: 1..6),
      agility: Faker::Number.within(range: 1..6),
      intellect: Faker::Number.within(range: 1..6),
      cunning: Faker::Number.within(range: 1..6),
      willpower: Faker::Number.within(range: 1..6),
      char_presence: Faker::Number.within(range: 1..6)
    )

    character.skills.create(
      astrogation: Faker::Number.within(range: 1..5),
      athletics: Faker::Number.within(range: 1..5),
      charm: Faker::Number.within(range: 1..5),
      coercion: Faker::Number.within(range: 1..5),
      computers: Faker::Number.within(range: 1..5),
      cool: Faker::Number.within(range: 1..5),
      coordination: Faker::Number.within(range: 1..5),
      deception: Faker::Number.within(range: 1..5),
      discipline: Faker::Number.within(range: 1..5),
      leadership: Faker::Number.within(range: 1..5),
      mechanics: Faker::Number.within(range: 1..5),
      negotiation: Faker::Number.within(range: 1..5),
      perception: Faker::Number.within(range: 1..5),
      piloting: Faker::Number.within(range: 1..5),
      piloting_space: Faker::Number.within(range: 1..5),
      resilience: Faker::Number.within(range: 1..5),
      skulduggery: Faker::Number.within(range: 1..5),
      stealth: Faker::Number.within(range: 1..5),
      street_wise: Faker::Number.within(range: 1..5),
      survival: Faker::Number.within(range: 1..5),
      vigilance: Faker::Number.within(range: 1..5),
      brawl: Faker::Number.within(range: 1..5),
      gunnery: Faker::Number.within(range: 1..5),
      melee: Faker::Number.within(range: 1..5),
      ranged_light: Faker::Number.within(range: 1..5),
      ranged_heavy: Faker::Number.within(range: 1..5),
      core_worlds: Faker::Number.within(range: 1..5),
      education: Faker::Number.within(range: 1..5),
      lore: Faker::Number.within(range: 1..5),
      outer_rim: Faker::Number.within(range: 1..5),
      underworld: Faker::Number.within(range: 1..5),
      xenology: Faker::Number.within(range: 1..5)
    )

    character.obligations.create(
      ob_type: 'sturdy',
      magnitude: Faker::Number.within(range: 1..5)
    )

    character.critical_injuries.create(
      severity: Faker::Number.within(range: 1..5),
      result: Faker::Name.name
    )

    character.equipment_logs.create(
      credits: Faker::Name.name,
      weapons: Faker::Name.name,
      armor: Faker::Name.name,
      personal_gear: Faker::Name.name
    )

    character.motivations.create(
      mo_type: Faker::Name.name
    )

    character.talents.create(
      name: Faker::Name.name,
      page_number: Faker::Number.within(range: 1..5),
      ability_summary: Faker::Name.name
    )

    character.weapons.create(
      skill: Faker::Name.name,
      damage: Faker::Number.within(range: 1..5),
      range: Faker::Number.within(range: 1..5),
      critical: Faker::Number.within(range: 1..5),
      special: Faker::Name.name
    )
end
