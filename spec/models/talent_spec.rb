require 'rails_helper'

RSpec.describe Talent, type: :model do
  it { should belong_to(:character) }
end
