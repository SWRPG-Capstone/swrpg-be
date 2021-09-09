require 'rails_helper'

RSpec.describe 'CreateSkill', type: :request do
  describe 'resolve' do

    describe 'happy path' do
      before :each do
        @user = User.create(username: Faker::Name.name)
        @character = @user.characters.create(name: Faker::Name.name, species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        @query =
        <<~GQL
            mutation {
              createSkill(
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
                core_worlds: 4
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
                outer_rim: 5
                perception: 1
                piloting: 2
                piloting_space: 3
                ranged_heavy: 4
                ranged_light: 5
                resilience: 1
                skulduggery: 2
                stealth: 3
                street_wise: 4
                survival: 5
                underworld: 1
                vigilance: 2
                xenology: 3
                }) {
                astrogation
                athletics
                brawl
                charm
                coercion
                computers
                cool
                coordination
                core_worlds
                deception
                discipline
                education
                gunnery
                leadership
                lore
                mechanics
                medicine
                melee
                negotiation
                outer_rim
                perception
                piloting
                piloting_space
                ranged_heavy
                ranged_light
                resilience
                skulduggery
                stealth
                street_wise
                survival
                underworld
                vigilance
                xenology
                }
              }
          GQL
      end

      it 'creates skill' do
        expect(Skill.count).to eq(0)
        post '/graphql', params: { query: @query }
        binding.pry
        expect(Skill.count).to eq(1)
      end
    end
    #
    # describe 'sad path' do
    #   before :each do
    #     @user = User.create(username: "test")
    #   end
    #
    #   it 'if no name included, returns error' do
    #     @query =
    #       <<~GQL
    #         mutation {
    #           createCharacter(input: {
    #             userId: "#{@user.id}"
    #             name: "#{}"
    #             species: "human"
    #             specialization: "being very serious"
    #             career: "jedi"
    #             age: 34
    #             height: "6ft 5in"
    #             build: "lean"
    #             hair: "bald"
    #             eyes: "black"
    #           }
    #           ) {
    #             age
    #             build
    #             career
    #             eyes
    #             hair
    #             height
    #             id
    #             name
    #             specialization
    #             species
    #           }
    #         }
    #        GQL
    #
    #     post '/graphql', params: { query: @query}
    #     json = JSON.parse(response.body)
    #     data = json['errors']
    #     expect(data[0]['message']).to eq("Name can't be blank")
    #   end
  end
end
