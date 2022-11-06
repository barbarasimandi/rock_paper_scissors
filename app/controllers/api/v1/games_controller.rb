require 'rps_client'

module Api
  module V1
    class GamesController < ApplicationController
      def play
        user_choice = user_choice_params.fetch(:user_choice, "no_choice_provided").to_sym
        opponent_choice = RpsClient.fetch_opponent_choice.to_sym

        result = GameEvaluator.call(user_choice: user_choice, opponent_choice: opponent_choice)

        render json: result, status: 200
      rescue StandardError => e
        render json: e.message, status: 422
      end

      private

      def user_choice_params
        params.permit(:user_choice)
      end
    end
  end
end
