require_relative 'spec_helper.rb'

RSpec.describe 'PrimeNumberChecker' do
  let (:checker) { PrimeNumberChecker.new(test_number) }
  let (:test_number) { 2 }

  describe 'easy primes' do
    describe 'when the number is 2' do
      it 'outputs prime and no prime factors' do
        expect(checker.check_prime).to eq({ prime: true, prime_factor: nil })
      end

      it 'does not attempt to check for additional prime factors' do
        expect(checker).not_to receive(:easy_prime_factors?)
        expect(checker).not_to receive(:other_prime_factors?)
        checker.check_prime
      end
    end

    describe 'when the number is 3' do
      let (:test_number) { 3 }

      it 'outputs prime and no prime factors' do
        expect(checker.check_prime).to eq({ prime: true, prime_factor: nil })
      end

      it 'does not attempt to check for additional prime factors' do
        expect(checker).not_to receive(:easy_prime_factors?)
        expect(checker).not_to receive(:other_prime_factors?)
        checker.check_prime
      end
    end
  end

  describe 'easy prime factors' do
    describe 'when the number is divisible by 2' do
      let (:test_number) { 24 }

      it 'outputs a prime factor and NOT prime' do
        expect(checker.check_prime).to eq({ prime: false, prime_factor: 2 })
      end

      it 'does not attempt to check for additional prime factors' do
        expect(checker).not_to receive(:other_prime_factors?)
        checker.check_prime
      end
    end
  
    describe 'when the number is divisible by 3' do
      let (:test_number) { 333 }

      it 'outputs a prime factor and NOT prime' do
        expect(checker.check_prime).to eq({ prime: false, prime_factor: 3 })
      end

      it 'does not attempt to check for additional prime factors' do
        expect(checker).not_to receive(:other_prime_factors?)
        checker.check_prime
      end
    end

    describe 'when the number is divisible by 5' do
      let(:test_number) { 25 }

      it 'outputs a prime factor and NOT prime' do
        expect(checker.check_prime).to eq({ prime: false, prime_factor: 5 })
      end

      it 'does not attempt to check for additional prime factors' do
        expect(checker).not_to receive(:other_prime_factors?)
        checker.check_prime
      end
    end
  end

  describe 'harder cases' do
    describe 'when the number is NOT prime' do
      let (:test_number) { 77 }

      it 'outputs a prime factor and NOT prime' do
        expect(checker.check_prime).to eq({ prime: false, prime_factor: 11 })
      end

      it 'checks for additional prime factors' do
        expect(checker).to receive(:other_prime_factors?)
        checker.check_prime
      end
    end

    describe 'when the number is prime' do
      let(:test_number) { 101 }

      it 'outputs prime and does not set any prime factors' do
        expect(checker.check_prime).to eq({ prime: true, prime_factor: nil })
      end

      it 'checks for additional prime factors' do
        expect(checker).to receive(:other_prime_factors?)
        checker.check_prime
      end
    end
  end
end


