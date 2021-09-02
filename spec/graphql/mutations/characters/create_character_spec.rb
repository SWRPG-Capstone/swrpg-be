require 'rails_helper'

RSpec.describe 'CreateCharacter', type: :request do
  describe '.resolve' do
    before :each do
      @user = User.create(username: "test")
      @query = <<~GQL
                    mutation {
                      character: createCharacter(
                                              input: {
                                                userId: "#{@user.id}"
                                                name: "Mace Windu"
                                                species: "human"
                                                specialization: "being very serious"
                                                career: "jedi"
                                                age: 34
                                                height: "6ft 5in"
                                                build: "lean"
                                                hair: "bald"
                                                eyes: "black"
                                            } 
                                            ) {
                                              age 
                                              build
                                              career 
                                              eyes 
                                              hair
                                              height 
                                              id 
                                              name
                                              specialization
                                              species
                                            }
                                          }
              GQL
    end

    it 'creates character' do
      expect(Character.count).to eq(0)
      post '/graphql', params: { query: @query }
      expect(Character.count).to eq(1)
    end

    it 'returns character' do
      post '/graphql', params: { query: @query }
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:character]
      
      expect(data[:name]).to eq("Mace Windu")
      expect(data[:species]).to eq("human")
      expect(data[:career]).to eq("jedi")
      expect(data[:age]).to eq(34)
      expect(data[:height]).to eq("6ft 5in")
      expect(data[:build]).to eq("lean")
      expect(data[:hair]).to eq("bald")
      expect(data[:eyes]).to eq("black")
    end
  end
end