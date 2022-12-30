require 'rails_helper'

RSpec.describe 'LoginUser', type: :request do
  describe '.resolve' do  
    describe 'happy path' do
      it 'logs user in successfully' do
        user = create_user 

        result = perform(
          credentials: {
            username: user.username,
            password: user.password
          }
        )

        expect(result[:token]).present?
        expect(result[:user]).to eq(user) 
      end
    end
    
    describe 'sad path' do
      it 'does not login user when credentials are missing' do
        expect(perform).to be_nil
      end

      it 'does not login user when username is incorrect' do
        user = create_user

        result = perform(
          credentials: { 
            username: 'Wil', 
            password: user.password,
          }
        )

        expect(result).to be_nil
      end

      it 'does not login user when password is incorrect' do
        user = create_user

        result = perform(
          credentials: { 
            username: user.username,
            password: "123445678",
          }
        )

        expect(result).to be_nil
      end
    end
    
  private

    def create_user
      user = User.create!(
        username: "Will", 
        password: "12345678",
        password_confirmation: "12345678"
      )
    end

    def perform(args = {})
      Mutations::Users::LoginUser.new(object: nil, field: nil, context: { session: {} }).resolve(**args)
    end
  end
end