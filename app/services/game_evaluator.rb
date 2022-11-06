class GameEvaluator < ApplicationService
  attr_reader :user_choice, :opponent_choice

  RULES = {
    rock: [:scissors],
    paper: [:rock],
    scissors: [:paper]
  }.freeze

  def initialize(options = {})
    @user_choice = options[:user_choice].to_sym
    @opponent_choice = options[:opponent_choice].to_sym
  end

  def call
    evaluate
  end

  private

  def evaluate
    if RULES[opponent_choice].include?(user_choice)
      "User choice: #{user_choice}, Opponent choice: #{opponent_choice}. Opponent wins!"
    elsif RULES[user_choice].include?(opponent_choice)
      "User choice: #{user_choice}, Opponent choice: #{opponent_choice}. User wins!"
    else
      "User choice: #{user_choice}, Opponent choice: #{opponent_choice}. It's a tie!"
    end
  end
end
