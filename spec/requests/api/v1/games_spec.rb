require 'rails_helper'

RSpec.describe "Api::V1::Games", type: :request do
  describe "GET /api/v1/welcome" do
    it "works! (now write some real specs)" do
      get api_v1_welcome_path
      expect(response).to have_http_status(200)
    end
  end
end
