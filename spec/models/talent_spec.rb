require 'rails_helper'

RSpec.describe Talent, type: :model do
  describe 'relationships' do
    it { should belong_to(:character) }
  end
end
