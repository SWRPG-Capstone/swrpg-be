require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:characteristics) }
    it { should have_many(:skills) }
    it { should have_many(:obligations) }
    it { should have_many(:critical_injuries) }
    it { should have_many(:motivations) }
    it { should have_many(:talents) }
    it { should have_one(:equipment_log) }
  end
end
