require 'rails_helper'

RSpec.describe 'CreateCharacter', type: :request do
  describe '.resolve' do
    
    describe 'happy path' do
      before :each do
        @user = User.create(username: "test")
        @query = <<~GQL
                      mutation {
                        createCharacter(
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


    describe 'sad path' do
      before :each do
        @user = User.create(username: "test")
      end

      it 'if no name included, returns error' do
        def query
          <<~GQL
          mutation {
            character: createCharacter(
            input: {
              userId: "#{@user.id}"
              name:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \":\" (COLON) at [6, 12]")
      end

      it 'if no species included, returns error' do
        def query
          <<~GQL
          mutation {
            character: createCharacter(
            input: {
              userId: "#{@user.id}"
              name: "Mace Windu"
              species:
              specialization:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \":\" (COLON) at [7, 19]")
      end

      it 'if no specialization included, returns error' do
        def query
          <<~GQL
          mutation {
            character: createCharacter(
            input: {
              userId: "#{@user.id}"
              name: "Mace Windu"
              species: "human"
              specialization:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \":\" (COLON) at [8, 11]")
      end

      it 'if no career included, returns error' do
        def query
          <<~GQL
          mutation {
            character: createCharacter(
            input: {
              userId: "#{@user.id}"
              name: "Mace Windu"
              species: "human"
              specialization: "being very serious"
              career:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \":\" (COLON) at [9, 8]")
      end

      it 'if no age included, returns error' do
        def query
          <<~GQL
          mutation {
            character: createCharacter(
            input: {
              userId: "#{@user.id}"
              name: "Mace Windu"
              species: "human"
              specialization: "being very serious"
              career: "jedi"
              age:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \":\" (COLON) at [10, 11]")
      end

      it 'if no height included, returns error' do
        def query
          <<~GQL
          mutation {
            character: createCharacter(
            input: {
              userId: "#{@user.id}"
              name: "Mace Windu"
              species: "human"
              specialization: "being very serious"
              career: "jedi"
              age: 34
              height:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \":\" (COLON) at [11, 10]")
      end

      it 'if no build included, returns error' do
        def query
          <<~GQL
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
              build:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \":\" (COLON) at [12, 9]")
      end

      it 'if no hair included, returns error' do
        def query
          <<~GQL
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
              hair:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \":\" (COLON) at [13, 9]")
      end

      it 'if no eyes included, returns error' do
        def query
          <<~GQL
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
              eyes:
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

        post '/graphql', params: { query: query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Parse error on \"}\" (RCURLY) at [14, 3]")
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
