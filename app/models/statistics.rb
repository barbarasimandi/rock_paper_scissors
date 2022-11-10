class Statistics < ActiveRecord::Base
  validate :there_can_be_only_one, on: :create

  def self.instance
    first_or_create(
      user_won: 0,
      opponent_won: 0,
      total_played: 0
    )
  end

  private

  def there_can_be_only_one
    return unless self.class.count.positive?

    errors.add(:base, "Only one #{self.class.name.downcase} is allowed")
  end
end
