require 'rails_helper'

RSpec.describe 'CreateTalent', type: :request do
  describe '#resolve' do
    describe 'happy path' do
      before :each do
        @user = User.create(username: 'Roald',
                            password: 'Test_1234!',
                            password_confirmation: 'Test_1234!')

        @character = @user.characters.create(name: 'Lou',
                                            species: 'Polar Bear',
                                            specialization: 'Ice Hockey',
                                            career: 'Coke Spokesperson',
                                            age: 44,
                                            height: '7ft, 3in',
                                            build: 'RIIIIIPPPPPED',
                                            hair: 'More like fur',
                                            eyes: 'hazel')
        @query = <<~GQL
          mutation {
            createTalent(
              input: {
                characterId: #{@character.id}
                name: "Super Talent"
                pageNumber: 11
                abilitySummary: "A super talent!"
              }
            ) {
              name
              pageNumber
              abilitySummary
            }
          }
            GQL
      end

      it 'creates a talent' do
        expect(Talent.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Talent.count).to eq(1)
      end
    end

    describe 'sad path' do
      before :each do 
        @user = User.create(username: 'Roald1',
                            password: 'Test_1234!',
                            password_confirmation: 'Test_1234!')

        @character = @user.characters.create(name: 'Lou',
                                             species: 'Polar Bear',
                                             specialization: 'Ice Hockey',
                                             career: 'Coke Spokesperson',
                                             age: 44,
                                             height: '7ft, 3in',
                                             build: 'RIIIIIPPPPPED',
                                             hair: 'More like fur',
                                             eyes: 'hazel')
        @query = <<~GQL
          mutation {
            createTalent(
              input: {
                characterId: #{@character.id}
                pageNumber: 11
                abilitySummary: "A super talent!"
              }){
                name
                pageNumber
                abilitySummary
                }
              }
          GQL
      end

      it 'throws error when missing params' do
        error_message = "Argument 'name' on InputObject 'CreateTalentInput' is required. Expected type String!"
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:errors][0][:message]).to eq(error_message)
      end
    end
  end
end