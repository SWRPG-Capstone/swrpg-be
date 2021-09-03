require 'rails_helper'

RSpec.describe 'CreateSkill', type: :request do
  describe '#resolve' do
    before :each do
      @user = User.create(username: 'Roald')
      @character = @user.characters.create(name: 'Lou', species: 'Polar Bear', specialization: 'Ice Hockey', career: 'Coke Spokesperson', age: 44, height: '7ft, 3in', build: 'RIIIIIPPPPPED', hair: 'More like fur', eyes: 'hazel')
      @query = <<~GQL
                    mutation {
                      skill: createSkill(
                        input: {
                          characterId: #{@character.id}
                          astrogation: 1
                          athletics: 2
                          brawl: 3
                          charm: 4
                          coercion: 5
                          computers: 1
                          cool: 2
                          coordination: 3
                          coreWorlds: 4
                          deception: 5
                          discipline: 1
                          education: 2
                          gunnery: 3
                          leadership: 4
                          lore: 5
                          mechanics: 1
                          medicine: 2
                          melee: 3
                          negotiation: 4
                          outerRim: 5
                          perception: 1
                          piloting: 2
                          pilotingSpace: 3
                          rangedHeavy: 4
                          rangedLight: 5
                          resilience: 1
                          skulduggery: 2
                          stealth: 3
                          streetWise: 4
                          survival: 5
                          underworld: 1
                          vigilance: 2
                          xenology: 3
                        }
                      ) {
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
    end
      it 'creates skills' do
        expect(Skill.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Skill.count).to eq(1)
      end

      it 'returns skill' do
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)
        skills = json[:data][:skill]

        expect(skills[:astrogation]).to eq(1)
        expect(skills[:athletics]).to eq(2)
        expect(skills[:brawl]).to eq(3)
        expect(skills[:charm]).to eq(4)
        expect(skills[:coercion]).to eq(5)
        expect(skills[:xenology]).to eq(3)
      end
    end
  end
