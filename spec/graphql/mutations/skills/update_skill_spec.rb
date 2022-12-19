require 'rails_helper'

RSpec.describe 'Update Skill', type: :request do
  describe 'resolve' do
    before :each do
      @user = User.create(username: Faker::Name.name, password: 'Test_1234!', password_confirmation: 'Test_1234!')
      @character = @user.characters.create(
        name: Faker::Name.name,
        species: Faker::Name.name,
        specialization: Faker::Name.name,
        career: Faker::Name.name,
        age: Faker::Number.number(digits: 2),
        height: Faker::Name.name,
        build: Faker::Name.name,
        hair: Faker::Name.name,
        eyes: Faker::Name.name
      )
      @skills = @character.skills.create(
        astrogation: 2,
        athletics: 2,
        brawl: 2,
        charm: 2,
        coercion: 2,
        computers: 2,
        cool: 2,
        coordination: 2,
        core_worlds: 2,
        deception: 2,
        discipline: 2,
        education: 2,
        gunnery: 2,
        leadership: 2,
        lore: 2,
        mechanics: 2,
        medicine: 2,
        melee: 2,
        negotiation: 2,
        outer_rim: 2,
        perception: 2,
        piloting: 2,
        piloting_space: 2,
        ranged_heavy: 2,
        ranged_light: 2,
        resilience: 2,
        skulduggery: 2,
        stealth: 2,
        street_wise: 2,
        survival: 2,
        underworld: 2,
        vigilance: 2,
        xenology: 2
      )
    end

    describe 'happy path' do 
      it 'shows current character skills' do
        expect(@skills.reload).to have_attributes(
          'astrogation': 2,
          'athletics': 2,
          'brawl': 2,
          'character_id': @character.id,
          'charm': 2,
          'coercion': 2,
          'computers': 2,
          'cool': 2,
          'coordination': 2,
          'core_worlds': 2,
          'deception': 2,
          'discipline': 2,
          'education': 2,
          'gunnery': 2,
          'id': @skills.id,
          'leadership': 2,
          'lore': 2,
          'mechanics': 2,
          'medicine': 2,
          'melee': 2,
          'negotiation': 2,
          'outer_rim': 2,
          'perception': 2,
          'piloting': 2,
          'piloting_space': 2,
          'ranged_heavy': 2,
          'ranged_light': 2,
          'resilience': 2,
          'skulduggery': 2,
          'stealth': 2,
          'street_wise': 2,
          'survival': 2,
          'underworld': 2,
          'vigilance': 2,
          'xenology': 2
        )
      end
  
      it 'returns updated character skills' do
        post '/graphql', params: { query: query(id: @skills.id, character_id: @character.id) }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:updateSkill]
  
        expect(data.count).to eq(35)
        expect(data).to include({
          :astrogation=>5,
          :athletics=>5,
          :brawl=>5,
          :characterId=>@character.id,
          :charm=>5,
          :coercion=>5,
          :computers=>5,
          :cool=>5,
          :coordination=>5,
          :coreWorlds=>5,
          :deception=>5,
          :discipline=>5,
          :education=>5,
          :gunnery=>5,
          :id=>@skills.id.to_s,
          :leadership=>5,
          :lore=>5,
          :mechanics=>5,
          :medicine=>5,
          :melee=>5,
          :negotiation=>5,
          :outerRim=>5,
          :perception=>5,
          :piloting=>5,
          :pilotingSpace=>5,
          :rangedHeavy=>5,
          :rangedLight=>5,
          :resilience=>5,
          :skulduggery=>5,
          :stealth=>5,
          :streetWise=>5,
          :survival=>5,
          :underworld=>5,
          :vigilance=>5,
          :xenology=>5
         })
      end
  
      it 'can update single skill' do
        post '/graphql', params: { query: single_query(id: @skills.id, character_id: @character.id) }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:updateSkill]
  
        expect(data.count).to eq(1)
        expect(data).to have_key(:astrogation)
        expect(data).to_not have_key(:agility)
        expect(data[:astrogation]).to eq(1)
      end  
    end

    describe 'sad path' do
      it 'cannot update skill without character id' do
        no_char_query = <<~GQL
                          mutation {
                            updateSkill(input: {
                              id: #{@skills.id}
                            }) 
                            {
                              astrogation
                            }
                          }
                        GQL

        post '/graphql', params: { query: no_char_query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:errors][0][:message]
                          
        expect(data).to eq("Argument 'characterId' on InputObject 'UpdateSkillInput' is required. Expected type Int!")
      end

      it 'cannot update skill if value is not an integer' do 
        wrong_query = <<~GQL
                        mutation {
                          updateSkill(input: {
                            characterId: #{@character.id}
                            id: #{@skills.id}
                            astrogation: "#{"1"}"
                          }) {
                            astrogation
                          }
                        }
                      GQL
        post '/graphql', params: { query: wrong_query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:errors][0][:message]
                          
        expect(data).to eq("Argument 'astrogation' on InputObject 'UpdateSkillInput' has an invalid value (\"1\"). Expected type 'Int'.")
      end

      it 'cannot update skill without skill id' do 
        no_skill_query = <<~GQL
                          mutation {
                            updateSkill(input: {
                              characterId: #{@character.id}
                              id: "#{}"
                            }) 
                            {
                              astrogation
                            }
                          }
                        GQL
        post '/graphql', params: { query: no_skill_query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:errors][0][:message]

        expect(data).to eq("Argument 'id' on InputObject 'UpdateSkillInput' has an invalid value (\"\"). Expected type 'Int!'.")
      end

      it 'cannot skill does not update when passed empty query' do
        empty_query =<<~GQL
                        mutation {
                          updateSkill(input: {
                            characterId: #{@character.id}
                            id: #{@skills.id}
                          }) {
                            astrogation
                          }
                        }
                      GQL

        post '/graphql', params: { query: empty_query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:updateSkill]
        
        expect(data[:astrogation]).to eq(@skills.astrogation)
      end
    end

    def query(id:, character_id:)
      <<~GQL
        mutation {
          updateSkill(input: {
            astrogation: 5,
            athletics: 5,
            brawl: 5,
            characterId: #{character_id},
            charm: 5,
            coercion: 5,
            computers: 5,
            cool: 5,
            coordination: 5,
            coreWorlds: 5,
            deception: 5,
            discipline: 5,
            education: 5,
            gunnery: 5,
            id: #{id},
            leadership: 5,
            lore: 5,
            mechanics: 5,
            medicine: 5,
            melee: 5,
            negotiation: 5,
            outerRim: 5,
            perception: 5,
            piloting: 5,
            pilotingSpace: 5,
            rangedHeavy: 5,
            rangedLight: 5,
            resilience: 5,
            skulduggery: 5,
            stealth: 5,
            streetWise: 5,
            survival: 5,
            underworld: 5,
            vigilance: 5,
            xenology: 5
          }) {
            astrogation
            athletics
            brawl
            characterId
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

    def single_query(id:, character_id:)
        <<~GQL
        mutation {
          updateSkill(input: {
            characterId: #{character_id}
            id: #{id}
            astrogation: 1
          }) {
            astrogation
          }
        }
      GQL
    end
  end
end
