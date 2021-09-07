require 'rails_helper'

RSpec.describe 'CreateCharacter', type: :request do
  describe '.resolve' do
    before :each do
      @user = User.create(username: "test")
      @query = <<~GQL
                    mutation {
                      createCharacter(
                                      input: {
                                      userId: "#{@user.id}"
                                      age: 34
                                      build: "lean"
                                      career: "jedi"
                                      eyes: "black"
                                      hair: "bald"
                                      height: "6ft 5in"
                                      name: "Mace Windu"
                                      specialization: "being very serious"
                                      species: "human"
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
      data = json[:data][:createCharacter]

      expect(data[:age]).to eq(34)
      expect(data[:build]).to eq("lean")
      expect(data[:career]).to eq("jedi")
      expect(data[:eyes]).to eq("black")
      expect(data[:hair]).to eq("bald")
      expect(data[:height]).to eq("6ft 5in")
      # Trying to change as little as possible but in mutation for CreateCharacter ID is not an argument hence it defaults as a string
      expect(data[:id]).to eq(@user.characters.last.id.to_s)
      expect(data[:name]).to eq("Mace Windu")
      expect(data[:specialization]).to eq("being very serious")
      expect(data[:species]).to eq("human")
    end
  end
end
