require 'rails_helper'

RSpec.describe "Api::V1::Games", type: :request do
  describe "GET /api/v1/play" do
    context "with user choice param" do
      it "has http status 200" do
        get api_v1_play_path, params: { user_choice: "paper" }
        expect(response).to have_http_status(200)
      end

      it "unknown weapon returns http status 422" do
        get api_v1_play_path, params: { user_choice: "hammer" }
        expect(response).to have_http_status(422)
      end
    end

    context "without user_choice param" do
      it "returns http status 422" do
        get api_v1_play_path
        expect(response).to have_http_status(422)
      end
    end
  end
end
