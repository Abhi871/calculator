class StringCalculator < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?

    # Default delimiter is comma or newline
    delimiter = /,|\n/

    if numbers.start_with?("//")
      # If the first line starts with "//", it contains the delimiter information
      first_line, numbers = numbers.split("\n", 2)

      # # Extract the delimiter from the first line
      # delimiter = Regexp.escape(first_line[2])

      # # Handle the case where the delimiter is a newline
      # delimiter = delimiter + '|\n'

      # Remove the delimiter from the first line
      delimiter = parse_delimiters(first_line)
    end

    # # Split the input string by the delimiter and convert to integers and sum them
    # numbers.split(/#{delimiter}/).map(&:to_i).sum

    # Split the input string by the delimiter and convert to integers
    nums = numbers.split(delimiter).map(&:to_i)

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

  private

  def self.parse_delimiters(first_line)
    first_line = if first_line[2] == "["
                   # If the delimiter is enclosed in square brackets, extract it
                   delimiters = first_line.scan(/\[(.*?)\]/).flatten

                   # Combine all delimiters into a single regular expression
                   Regexp.union(delimiters << 'n')
                 else
                   # If the delimiter is a single character, use it as is
                   delimiter = Regexp.escape(first_line[2])
                   delimiter + '|\n'
                 end

    Regexp.new(first_line)
  end
end
