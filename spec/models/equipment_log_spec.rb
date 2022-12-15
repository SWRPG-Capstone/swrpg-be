require 'rails_helper'

RSpec.describe EquipmentLog, type: :model do
  describe 'relationships' do
    it { should belong_to(:character) }
    it { should have_many(:weapons_in_equipment_log) }
    it { should have_many(:weapons).through(:weapons_in_equipment_log) }
  end
end
