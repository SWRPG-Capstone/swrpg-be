require 'rails_helper'

RSpec.describe Types::SkillType, type: :request do
  describe 'display skills' do
    it 'returns skills for a given character' do
      user = User.create(username: "test")
      mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      mace_skills = mace.skills.create(astrogation: 1, athletics: 1, brawl: 1, charm: 1, coercion: 1, computers: 1, cool: 1, coordination: 1, core_worlds: 1, deception: 1, discipline: 1, education: 1, gunnery: 1, leadership: 1, lore: 1, mechanics: 1, medicine: 1, melee: 1, negotiation: 1, outer_rim: 1, perception: 1, piloting: 1, piloting_space: 1, ranged_heavy: 1, ranged_light: 1, resilience: 1, skulduggery: 1, stealth: 1, street_wise: 1, survival: 1, underworld: 1, vigilance: 1, xenology: 1)
      vader_skills = vader.skills.create(astrogation: 2, athletics: 2, brawl: 2, charm: 2, coercion: 2, computers: 2, cool: 2, coordination: 2, core_worlds: 2, deception: 2, discipline: 2, education: 2, gunnery: 2, leadership: 2, lore: 2, mechanics: 2, medicine: 2, melee: 2, negotiation: 2, outer_rim: 2, perception: 2, piloting: 2, piloting_space: 2, ranged_heavy: 2, ranged_light: 2, resilience: 2, skulduggery: 2, stealth: 2, street_wise: 2, survival: 2, underworld: 2, vigilance: 2, xenology: 2)
      query = <<~GQL
                query {
                  skill(characterId: #{mace.id}){
                  astrogation
                  athletics
                  brawl
                  charm
                  coercion
                  computers
                  cool
                  coordination
                  coreWorlds
                  deception
                  discipline
                  education
                  gunnery
                  id
                  leadership
                  lore
                  mechanics
                  medicine
                  melee
                  negotiation
                  outerRim
                  perception
                  piloting
                  pilotingSpace
                  rangedHeavy
                  rangedLight
                  resilience
                  skulduggery
                  stealth
                  streetWise
                  survival
                  underworld
                  vigilance
                  xenology
                  }
                }
              GQL

      post '/graphql', params: {query: query}
      json = JSON.parse(response.body, symbolize_names: true)
      skills = json[:data][:skill]

      expect(skills).to have_key(:astrogation)
      expect(skills).to have_key(:athletics)
      expect(skills).to have_key(:brawl)
      expect(skills).to have_key(:charm)
      expect(skills).to have_key(:coercion)
      expect(skills).to have_key(:computers)
      expect(skills).to have_key(:cool)
      expect(skills).to have_key(:coordination)
      expect(skills).to have_key(:coreWorlds)
      expect(skills).to have_key(:deception)
      expect(skills).to have_key(:discipline)
      expect(skills).to have_key(:education)
      expect(skills).to have_key(:gunnery)
      expect(skills).to have_key(:id)
      expect(skills).to have_key(:leadership)
      expect(skills).to have_key(:lore)
      expect(skills).to have_key(:mechanics)
      expect(skills).to have_key(:medicine)
      expect(skills).to have_key(:melee)
      expect(skills).to have_key(:negotiation)
      expect(skills).to have_key(:outerRim)
      expect(skills).to have_key(:perception)
      expect(skills).to have_key(:piloting)
      expect(skills).to have_key(:pilotingSpace)
      expect(skills).to have_key(:rangedHeavy)
      expect(skills).to have_key(:rangedLight)
      expect(skills).to have_key(:resilience)
      expect(skills).to have_key(:skulduggery)
      expect(skills).to have_key(:stealth)
      expect(skills).to have_key(:streetWise)
      expect(skills).to have_key(:survival)
      expect(skills).to have_key(:underworld)
      expect(skills).to have_key(:vigilance)
      expect(skills).to have_key(:xenology)
      expect(skills[:charm]).to eq(1)
      expect(skills[:survival]).to_not eq(2)
    end
  end
end
