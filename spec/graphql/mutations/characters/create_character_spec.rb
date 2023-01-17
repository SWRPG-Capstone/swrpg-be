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


      it 'returns character' do
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:createCharacter]
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
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Name can't be blank")
        expect(Character.count).to eq(0)
      end

      it 'if no species included, returns error' do
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "Mace Windu"
                species: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Species can't be blank")
        expect(Character.count).to eq(0)
      end

      it 'if no specialization included, returns error' do
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "Mace Windu"
                species: "human"
                specialization: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Specialization can't be blank")
        expect(Character.count).to eq(0)
      end

      it 'if no career included, returns error' do
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "Mace Windu"
                species: "human"
                specialization: "being very serious"
                career: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Career can't be blank")
        expect(Character.count).to eq(0)
      end

      it 'if no age included, returns error' do
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "Mace Windu"
                species: "human"
                specialization: "being very serious"
                career: "jedi"
                age: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Argument 'age' on InputObject 'CreateCharacterInput' has an invalid value (\"\"). Expected type 'Int!'.")
        expect(Character.count).to eq(0)
      end

      it 'if no height included, returns error' do
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "Mace Windu"
                species: "human"
                specialization: "being very serious"
                career: "jedi"
                age: 34
                height: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Height can't be blank")
        expect(Character.count).to eq(0)
      end

      it 'if no build included, returns error' do
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "Mace Windu"
                species: "human"
                specialization: "being very serious"
                career: "jedi"
                age: 34
                height: "6ft 5in"
                build: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Build can't be blank")
        expect(Character.count).to eq(0)
      end

      it 'if no hair included, returns error' do
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "Mace Windu"
                species: "human"
                specialization: "being very serious"
                career: "jedi"
                age: 34
                height: "6ft 5in"
                build: "lean"
                hair: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Hair can't be blank")
        expect(Character.count).to eq(0)
      end

      it 'if no eyes included, returns error' do
        @query =
          <<~GQL
            mutation {
              createCharacter(input: {
                userId: "#{@user.id}"
                name: "Mace Windu"
                species: "human"
                specialization: "being very serious"
                career: "jedi"
                age: 34
                height: "6ft 5in"
                build: "lean"
                hair: "bald"
                eyes: "#{}"
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

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Eyes can't be blank")
        expect(Character.count).to eq(0)
      end
    end
  end
end
