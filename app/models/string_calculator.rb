class StringCalculator < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?

    # Split the numbers by delimiters
    nums = numbers.split(/[^\d|-]/).reject(&:blank?).map(&:to_i)

    # Remove numbers greater than 1000
    nums = nums.reject { |num| num > 1000 }
    
    # Check for negative numbers
    negatives = nums.select(&:negative?)
    
    # If there are negative numbers, raise an error
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    nums.sum
  end
end
