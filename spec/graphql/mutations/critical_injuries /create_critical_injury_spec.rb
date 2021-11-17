require 'rails_helper'

RSpec.describe 'CreateCriticalInjury', type: :request do
  describe '#resolve' do
    describe 'happy path' do
      before :each do
        @user = User.create(username: 'Roald')
        @character = @user.characters.create(name: 'Lou', species: 'Polar Bear', specialization: 'Ice Hockey', career: 'Coke Spokesperson', age: 44, height: '7ft, 3in', build: 'RIIIIIPPPPPED', hair: 'More like fur', eyes: 'hazel')
        @query = <<~GQL
                      mutation {
                        criticalInjury: createCriticalInjury(
                          input: {
                            characterId: #{@character.id}
                            severity: 1
                            result: "damaged" 
                          }
                        ) {
                           severity 
                           result
                        }
                      }
                      GQL
      end

      it 'creates critical injury' do
        expect(CriticalInjury.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(CriticalInjury.count).to eq(1)
      end

      it 'returns critical injury' do
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)
        crit_injury = json[:data][:criticalInjury]

        expect(crit_injury[:severity]).to eq(1)
        expect(crit_injury[:result]).to eq('damaged')
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
                        criticalInjury: createCriticalInjury(
                          input: {
                            characterId: "#{}"
                            severity: 1
                            result: "damaged" 
                          }
                        ) {
                           severity 
                           result
                        }
                      }
                      GQL

        post '/graphql', params: { query: @query}
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Argument 'characterId' on InputObject 'CreateWeaponInput' has an invalid value (\"\"). Expected type 'Int!'.")
        expect(CriticalInjury.count).to eq(0)
      end
    end
  end
end
