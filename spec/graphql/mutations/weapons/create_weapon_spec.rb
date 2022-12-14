require 'rails_helper'

RSpec.describe 'CreateWeapon', type: :request do
  describe '#resolve' do
    describe 'happy path' do
      before :each do
        @user = User.create(username: 'Roald')
        @character = @user.characters.create(
          name: 'Lou',
          species: 'Polar Bear',
          specialization: 'Ice Hockey',
          career: 'Coke Spokesperson',
          age: 44,
          height: '7ft, 3in',
          build: 'RIIIIIPPPPPED',
          hair: 'More like fur',
          eyes: 'hazel'
        )
        @query = <<~GQL
          mutation {
            weapon: createWeapon(
              input: {
                characterId: #{@character.id}
                skill: "supercharge"
                special: "special smash"
                damage: 1
                range: 5
                critical: 3
              }
            ) {
              characterId
              skill
              special
              damage
              range
              critical
            }
          }
        GQL
      end

      it 'creates weapon' do
        expect(Weapon.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Weapon.count).to eq(1)
      end

      it 'returns weapons' do
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)
        weapon = json[:data][:weapon]
      end

      it 'returns weapon' do
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)
        weapon = json[:data][:weapon]

        expect(weapon[:skill]).to eq('supercharge')
        expect(weapon[:special]).to eq('special smash')
        expect(weapon[:damage]).to eq(1)
        expect(weapon[:range]).to eq(5)
        expect(weapon[:critical]).to eq(3)
      end
    end

    describe 'sad path' do
      before :each do
        @user = User.create(username: 'Roald')
        @character = @user.characters.create(name: 'Lou', species: 'Polar Bear', specialization: 'Ice Hockey', career: 'Coke Spokesperson', age: 44, height: '7ft, 3in', build: 'RIIIIIPPPPPED', hair: 'More like fur', eyes: 'hazel')
      end

      it 'if attributes not included, returns error' do
        @query = <<~GQL
        mutation {
          weapon: createWeapon(
            input: {
              characterId: "#{}"
              skill: "supercharge"
              special: "special smash"
              damage: 1
              range: 5
              critical: 3
            }
          ) {
            characterId
            skill
            special
            damage
            range
            critical
          }
        }
        GQL

        error_msg = "Argument 'characterId' on InputObject 'CreateWeaponInput' has an invalid value (\"\"). Expected type 'Int!'."
        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq(error_msg)
        expect(Weapon.count).to eq(0)
      end
    end
  end
end
