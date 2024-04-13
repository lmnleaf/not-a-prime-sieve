require_relative 'spec_helper.rb'

RSpec.describe 'Number' do
  let(:number) { Number.new(test_number) }
  let(:test_number) { '77' }

  it 'is initialized with a test number that it converts to an integer' do
    expect(number.integer_value).to be_an_instance_of Integer
  end

  describe 'when a number is not prime' do
    it 'returns NOT prime and a prime factor' do
      expect(number.prime?).to eq false
      expect(number.prime_factor).to eq 11
    end
  end

  describe 'when a number is prime' do
    let(:test_number) { '101' }

    it 'returns prime and no prime factors' do
      expect(number.prime?).to eq true
      expect(number.prime_factor).to eq nil
    end
  end
end
