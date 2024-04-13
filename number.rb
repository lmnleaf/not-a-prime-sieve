require_relative 'prime_number_checker.rb'

class Number
  def initialize test_number
    @integer_value = test_number.to_i
    @prime = nil
    @prime_factor = nil
    @checker = PrimeNumberChecker.new(integer_value)
  end

  attr_accessor :integer_value, :prime, :prime_factor, :checker

  def prime?
    is_int_prime? if prime.nil?
    prime
  end

  def prime_factor?
    is_int_prime? if prime.nil?
    prime_factor
  end

  private

  def is_int_prime?
    result = checker.check_prime
    self.prime = result[:prime]
    self.prime_factor = result[:prime_factor]
  end
end
