require 'rails_helper'

RSpec.describe FieldTrip do
  it { should validate_presence_of(:name) }
end
