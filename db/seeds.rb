# Users
id = User.find_by(username: 'Dice Master').try(:id)

user_1 = id ? User.find(id) : User.create!(username: 'Dice Master', 
                                           password: 'Test_1234!',
                                           password_confirmation: 'Test_1234!')

# Characters
character_1 = user_1.characters.find_or_create_by!(name: 'Anya Forger', 
                                               species: 'Mystic', 
                                               specialization: 'Mind Reading', 
                                               career: 'Peace Keeper',
                                               age: 4,
                                               height: '3 feet 4 inches',
                                               build: 'Ummmm, child?',
                                               hair: 'pink',
                                               eyes: 'green')

# Characteristics
characteristics_1 = character_1.characteristics.find_or_create_by!(brawn: 1,
                                                                   agility: 2,
                                                                   char_presence: 1,
                                                                   cunning: 4,
                                                                   intellect: 2,
                                                                   willpower: 4)

# Critical Injuries
critical_injury_1 = character_1.critical_injuries.find_or_create_by!(severity: 1,
                                                                       result: 'Tis but a scratch')

# Weapons
weapon_1 = character_1.weapons.find_or_create_by!(skill: 'Ranged Light',
                                                  special: 'Piercing Shot',
                                                  damage: 5,
                                                  range: 2,
                                                  critical: 1)


                                                  # Equipment Logs
unless character_1.equipment_log
    equipment_log_1 = EquipmentLog.find_or_create_by!(character: character_1,
                                                      credits: '33',
                                                      weapons: [ weapon_1 ],
                                                      armor: 'Plot Armor',
                                                      personal_gear: 'Peeeaaaaanuts'
                                                      )
end

# Motivations
motivation_1 = character_1.motivations.find_or_create_by!(mo_type: 'World peace!')

# Obligations
obligation_1 = character_1.obligations.find_or_create_by!(ob_type: 'Blood Pact',
                                                          magnitude: 1)

# Skills
skills_1 = character_1.skills.find_or_create_by!(astrogation: 1,
                                                 athletics: 1,
                                                 charm: 5,
                                                 coercion: 5,
                                                 computers: 1,
                                                 cool: 5,
                                                 coordination: 1,
                                                 deception: 5,
                                                 discipline: 1,
                                                 leadership: 5,
                                                 mechanics: 1,
                                                 negotiation: 5,
                                                 perception: 5,
                                                 piloting: 1,
                                                 piloting_space: 1,
                                                 resilience: 5,
                                                 skulduggery: 1,
                                                 stealth: 5,
                                                 street_wise: 5,
                                                 survival: 5,
                                                 vigilance: 5,
                                                 brawl: 5,
                                                 gunnery: 2,
                                                 melee: 5,
                                                 ranged_light: 3,
                                                 ranged_heavy: 2,
                                                 core_worlds: 2,
                                                 education: 3,
                                                 lore: 4,
                                                 outer_rim: 3,
                                                 underworld: 2,
                                                 xenology: 1,
                                                 medicine: 2)
# Talents
talent_1 = character_1.talents.find_or_create_by(name: 'Mind Reading',
                                                 page_number: 55,
                                                 ability_summary: 'Waku waku I can read your MIND!')

