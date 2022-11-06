module Api
  module V1
    class GamesController < ApplicationController
      def play
        user_choice = user_choice_params.fetch(:user_choice, "no_choice_provided").to_sym
        opponent_choice = "rock".to_sym

        result =
          if rules[opponent_choice].include?(user_choice)
            "#{user_choice}, vs #{opponent_choice}. Opponent wins!"
          elsif rules[user_choice].include?(opponent_choice)
            "#{user_choice}, vs #{opponent_choice}. User wins!"
          else
            "#{user_choice}, vs #{opponent_choice}. It's a tie!"
          end

        render json: result, status: 200

      rescue StandardError => e
        render json: e.message, status: 422
      end

      private

      def rules
        {
          rock: [:scissors],
          paper: [:rock],
          scissors: [:paper]
        }
      end

      def user_choice_params
        params.permit(:user_choice)
      end
    end
  end
end
