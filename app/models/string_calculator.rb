class StringCalculator < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    numbers.split(/#{delimiter}/).map(&:to_i).sum
  end
end
