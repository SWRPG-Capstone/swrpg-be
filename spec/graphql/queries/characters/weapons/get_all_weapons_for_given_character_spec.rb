require 'rails_helper'

RSpec.describe Types::WeaponType, type: :request do
  describe 'display weapons' do
    describe 'happy path' do
      it 'returns a characters weaponss' do
        user = User.create(username: "test")
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_weapons = mace.weapons.create(skill: 'slash', special: 'bzzt', damage: 5, range: 4, critical: 3)
        vader_weapons = vader.weapons.create(skill: 'slice', special: 'blatyt', damage: 3, range: 3, critical: 5)

        query = <<~GQL
                  query {
                    weapon(characterId: #{vader.id}){
                      skill
                      special
                      damage
                      range
                      critical
                    }
                  }
                GQL
        
        post '/graphql', params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        weapon = json[:data][:weapon]
       
        expect(weapon).to have_key(:skill)
        expect(weapon).to have_key(:special)
        expect(weapon).to have_key(:damage)
        expect(weapon).to have_key(:range)
        expect(weapon).to have_key(:critical)

        expect(weapon[:skill]).to be_a(String)
        expect(weapon[:special]).to be_a(String)
        expect(weapon[:damage]).to be_an(Integer)
        expect(weapon[:range]).to be_an(Integer)
        expect(weapon[:critical]).to be_an(Integer)

        expect(weapon[:skill]).to eq(vader.weapons[0].skill)
        expect(weapon[:special]).to eq(vader.weapons[0].special)
        expect(weapon[:damage]).to eq(vader.weapons[0].damage)
        expect(weapon[:range]).to eq(vader.weapons[0].range)
        expect(weapon[:critical]).to eq(vader.weapons[0].critical)
      end 
    end
  end
end