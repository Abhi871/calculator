class StringCalculator < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?
  end
end