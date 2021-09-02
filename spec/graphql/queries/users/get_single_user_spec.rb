require 'rails_helper'

RSpec.describe Types::UserType, type: :request do
  it 'can return a single user by the id' do

    user = User.create(username: "Phil Collins")
    query = <<~GQL
              query {
                user(id: #{user.id}){
                  username
                }
              }
            GQL

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    user = json[:data][:user]

    expect(response).to be_successful
    expect(user.count).to eq(1)

    expect(user).to have_key(:username)
    
    expect(user[:username]).to be_an(String)

    expect(user[:username]).to eq("Phil Collins")
  end
end
