class StringCalculator < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?

    # Default delimiter is comma or newline
    delimiter = /,|\n/

    if numbers.start_with?("//")
      # If the first line starts with "//", it contains the delimiter information
      first_line, numbers = numbers.split("\n", 2)

      # Extract the delimiter from the first line
      delimiter = Regexp.escape(first_line[2])

      delimiter = delimiter + '|\n'
    end

    # Split the input string by the delimiter and convert to integers and sum them
    numbers.split(/#{delimiter}/).map(&:to_i).sum
  end
end
