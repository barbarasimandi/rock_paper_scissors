class GameEvaluator < ApplicationService
  class UnknownWeaponError < StandardError; end

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
    statistics.increment!(:total_played)

    unless RULES.keys.include?(user_choice) && RULES.keys.include?(opponent_choice)
      raise UnknownWeaponError,
            "Unknown weapon. Please select from #{RULES.keys.join(', ')}.
            \nReceived User choice: #{user_choice}, opponent choice: #{opponent_choice}."
    end

    { results: evaluate, user_win_percentage: "#{count_user_win_percentage}%" }
  end

  private

  def statistics
    @statistics ||= Statistics.instance
  end

  def evaluate
    if RULES[opponent_choice].include?(user_choice)
      statistics.increment!(:opponent_won)
      "User choice: #{user_choice}, Opponent choice: #{opponent_choice}. Opponent wins!"
    elsif RULES[user_choice].include?(opponent_choice)
      statistics.increment!(:user_won)
      "User choice: #{user_choice}, Opponent choice: #{opponent_choice}. User wins!"
    else
      "User choice: #{user_choice}, Opponent choice: #{opponent_choice}. It's a tie!"
    end
  end

  def count_user_win_percentage
    ((statistics.user_won.to_f / statistics.total_played) * 100).round(2)
  end
end
