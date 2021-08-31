require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it { should belong_to(:character) }
end
