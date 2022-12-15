require 'rails_helper'

RSpec.describe 'createUser', type: :request do
  describe '#resolve' do
    describe 'happy path' do
      before :each do
         @query = <<~GQL
          mutation {
            createUser(
              input: {
                username: "Lou"
                password: "Test_1234!"
                passwordConfirmation: "Test_1234!"
              }
            ) {
              username
            }
          }
        GQL
      end

      it 'creates a user' do
        expect(User.count).to eq(0)
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)
        expect(User.count).to eq(1)
      end
    end

    describe 'sad path' do
      before :each do
        @query = <<~GQL
          mutation {
            createUser(
              input: {
                password: "Test_1234!"
                passwordConfirmation: "Test_1234!"
              }
            ) {
              username
            }
          }
        GQL
      end

      it 'returns an error when username is not present' do
        error_message = "Argument 'username' on InputObject 'CreateUserInput' is required. Expected type String!"
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:errors][0][:message]).to eq(error_message)
      end
    end
  end
end