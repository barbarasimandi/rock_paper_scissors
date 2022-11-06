require "uri"
require "net/http"

class RpsClient
  class << self
    def fetch_opponent_choice
      uri = URI(url)
      response = Net::HTTP.get_response(uri)

      if response.code.to_i == 200
        JSON.parse(response.body, symbolize_names: true)
      else
        "rock"
      end
    end

    private

    def url
      "https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw"
    end
  end
end
