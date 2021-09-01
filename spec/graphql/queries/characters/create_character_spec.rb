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
                                                id
                                                name
                                                species
                                                specialization
                                                career
                                                age 
                                                height
                                                build
                                                hair
                                                eyes
                                            }
                                          }
              GQL
    end

    it 'creates character' do
      expect(Character.count).to eq(0)
      post '/graphql', params: {query: @query}
      expect(Character.count).to eq(1)
    end
  end
end