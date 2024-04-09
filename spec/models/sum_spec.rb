require 'rails_helper'

RSpec.describe Sum, type: :model do
  it 'returns 0 for an empty string' do
    expect(Sum.add("")).to eq(0)
  end

  it 'returns the number itself for a single number' do
    expect(Sum.add("1")).to eq(1)
  end

  it 'returns the sum of numbers for comma-separated numbers' do
    expect(Sum.add("1,5")).to eq(6)
  end

  it 'returns the sum of numbers for numbers separated by comma and newline' do
    expect(Sum.add("1\n2,3")).to eq(6)
  end

  it 'returns the sum of numbers for custom delimiter' do
    expect(Sum.add("//;\n1;2")).to eq(3)
  end

  it 'raises an error for negative numbers' do
    expect { Sum.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
  end

  it 'raises an error for multiple negative numbers' do
    expect { Sum.add("-1,-2,-3") }.to raise_error("Negative numbers not allowed: -1, -2, -3")
  end

  it 'ignores numbers greater than 1000' do
    expect(Sum.add("2,1001")).to eq(2)
  end
end
