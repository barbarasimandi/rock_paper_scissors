module Api
  module V1
    class GamesController < ApplicationController
      def welcome
        render json: "Welcome!"
      end
    end
  end
end
