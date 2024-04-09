class Sum < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?
  
    delimiter = ','
    if numbers.start_with?("//")
      delimiter, numbers = numbers.match(/\/\/(.)\n(.*)/).captures
    end
  
    negatives = numbers.split(/#{delimiter}|\n/).map(&:to_i).select { |num| num.negative? }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  
    numbers.split(/#{delimiter}|\n/).map(&:to_i).reject { |num| num > 1000 }.sum
  end
end