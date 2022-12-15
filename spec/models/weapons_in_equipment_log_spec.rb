require 'rails_helper'

RSpec.describe WeaponsInEquipmentLog, type: :model do
  describe 'relationships' do
    it { should belong_to(:weapon) }
    it { should belong_to(:equipment_log) }
  end
end