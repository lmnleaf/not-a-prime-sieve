require_relative 'spec_helper.rb'

RSpec.describe 'PrimeNumberChecker' do
  let (:checker) { PrimeNumberChecker.new(number, track_time) }
  let (:number) { 49 }
  let (:track_time) { false }

  it 'returns a statement indicating whether a number is prime' do
    expect(checker.check_number).to eq(
      "#{number} is NOT prime \n" + 
      "Prime factor: 7"
    )
  end

  describe 'easy cases' do
    describe 'when the number is divisible by 2' do
      let (:number) { 24 }

      it 'sets the prime factor to 2' do
        expect(checker).not_to receive(:check_any_prime_factors)
        expect(checker.check_number).to eq(
          "#{number} is NOT prime \n" + 
          "Prime factor: 2"
        )
      end
    end
  
    describe 'when the number is divisible by 3' do
      let (:number) { 333 }

      it 'sets the prime factor to 3' do
        expect(checker).not_to receive(:check_any_prime_factors)
        expect(checker.check_number).to eq(
          "#{number} is NOT prime \n" + 
          "Prime factor: 3"
        )
      end
    end

    describe 'when the number is divisible by 5' do
      let(:number) { 25 }

      it 'sets the prime factor to 5' do
        expect(checker).not_to receive(:check_any_prime_factors)
        expect(checker.check_number).to eq(
          "#{number} is NOT prime \n" + 
          "Prime factor: 5"
        )
      end
    end
  end

  describe 'harder cases' do
    let (:number) { 77 }

    it 'sets the prime factor to another prime when the number is divisible by something other than 2, 3, or 5' do
      expect(checker).to receive(:check_any_prime_factors)
      checker.check_number
    end

    it 'sets the prime factor to 7' do
      expect(checker.check_number).to eq(
        "#{number} is NOT prime \n" + 
        "Prime factor: 11"
      )
    end
  end
end


