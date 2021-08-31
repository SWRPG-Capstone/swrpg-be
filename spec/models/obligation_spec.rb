require 'rails_helper'

RSpec.describe Obligation, type: :model do
  it { should belong_to(:character) }
end
