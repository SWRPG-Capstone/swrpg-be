require 'rails_helper'

RSpec.describe CriticalInjury, type: :model do
  it { should belong_to(:character) }
end
