require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe '.add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns number for single number' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns sum for two numbers' do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it "returns the sum of all the numbers" do
      expect(StringCalculator.add("1,2,3,4")).to eq(10)
    end

    it "returns the sum of all the numbers with new lines" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "supports custom delimiters with multiple new lines" do
      expect(StringCalculator.add("//;\n1;2\n3\n4;5")).to eq(15)
    end

    it "raises an error for negative numbers" do
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed: -2, -4")
    end

    it "ignores numbers greater than 1000" do
      expect(StringCalculator.add("2,1001")).to eq(2)
      expect(StringCalculator.add("1000,1,2000")).to eq(1001)
    end
  end
end
