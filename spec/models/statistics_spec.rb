require 'rails_helper'

RSpec.describe Statistics, type: :model do
  it "should only allow one to be created" do
    FactoryBot.create(:statistics)
    other = FactoryBot.build(:statistics)
    expect(other).not_to be_valid
    expect(other.errors[:base]).to include("Only one #{other.class.name.downcase} is allowed")
  end
end
