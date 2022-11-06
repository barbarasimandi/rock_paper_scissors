require 'rails_helper'
require 'rps_client'

RSpec.describe RpsClient do
  describe "api returns Server Error, so 'rock' is generated locally" do
    it ".fetch_opponent_choice generates throw locally" do
      VCR.use_cassette("server_error") do
        expect(described_class.fetch_opponent_choice).to eq("rock")
      end
    end
  end
end
