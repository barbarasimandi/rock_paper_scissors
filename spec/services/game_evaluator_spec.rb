require 'rails_helper'

RSpec.describe GameEvaluator do
  describe '.call' do
    GameEvaluator::RULES.each_pair do |winner_choice, losing_possibilities|
      losing_possibilities.each do |loser_choice|
        context "when #{winner_choice}" do
          it "beats #{loser_choice}" do
            response = described_class.call(user_choice: winner_choice, opponent_choice: loser_choice)
            expect(response).to eq("User choice: #{winner_choice}, Opponent choice: #{loser_choice}. User wins!")
          end
        end

        context "when #{winner_choice}" do
          it "ties #{winner_choice}" do
            response = described_class.call(user_choice: winner_choice, opponent_choice: winner_choice)
            expect(response).to eq("User choice: #{winner_choice}, Opponent choice: #{winner_choice}. It's a tie!")
          end
        end

        context "when #{loser_choice}" do
          it "loses against #{winner_choice}" do
            response = described_class.call(user_choice: loser_choice, opponent_choice: winner_choice)
            expect(response).to eq("User choice: #{loser_choice}, Opponent choice: #{winner_choice}. Opponent wins!")
          end
        end
      end
    end
  end
end
