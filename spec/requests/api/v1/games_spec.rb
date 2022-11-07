require 'rails_helper'
require 'rps_client'

RSpec.describe "Api::V1::Games", type: :request do
  describe "GET /api/v1/play" do
    before do
      allow(RpsClient).to receive(:fetch_opponent_choice).and_return(opponent_choice)
    end

    let(:opponent_choice) do
      {
        statusCode: 200,
        message: "Generated locally",
        body: "rock"
      }
    end

    context "with user_choice param" do
      it "has http status 200" do
        get api_v1_play_path, params: { user_choice: "paper" }
        expect(response).to have_http_status(200)
      end

      it "unknown weapon has http status 422" do
        get api_v1_play_path, params: { user_choice: "hammer" }
        expect(response).to have_http_status(422)
      end
    end

    context "without user_choice param" do
      it "has http status 422" do
        get api_v1_play_path
        expect(response).to have_http_status(422)
      end
    end
  end
end
