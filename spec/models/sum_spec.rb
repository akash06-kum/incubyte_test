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
end
