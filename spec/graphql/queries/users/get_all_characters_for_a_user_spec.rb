require 'rails_helper'

RSpec.describe 'Users Characters', type: :request do
  describe 'happy path' do
    it 'return all characters for a single user' do
      user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
      mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      query = <<~GQL
                query {
                  user(id: #{user.id}) {
                    username
                    characters {
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
                }
              GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
      character = json[:data][:user]

      expect(character).to be_a(Hash)
      expect(character[:characters]).to be_a(Array)
      expect(character[:characters].count).to eq(2)

      expect(character[:characters].first).to have_key(:species)
      expect(character[:characters].first).to have_key(:specialization)
      expect(character[:characters].first).to have_key(:career)
      expect(character[:characters].first).to have_key(:age)
      expect(character[:characters].last).to have_key(:height)
      expect(character[:characters].last).to have_key(:build)
      expect(character[:characters].last).to have_key(:hair)
      expect(character[:characters].last).to have_key(:eyes)
      expect(user.characters).to eq([mace, vader])
    end
  end

  describe 'sad path' do
    it 'if no user id provided, returns error' do
      user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
      mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      query = <<~GQL
                query {
                  user(id: "#{}") {
                    username
                    characters {
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
                }
              GQL

              post '/graphql', params: { query: @query}
              json = JSON.parse(response.body)
              data = json['errors']
              expect(data[0]['message']).to eq("No query string was present")
    end
  end
end
