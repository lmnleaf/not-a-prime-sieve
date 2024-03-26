require 'pry-byebug'

class PrimeNumberChecker
  def initialize integer_value
    @integer_value = integer_value
    @prime_factor = nil
  end

  attr_accessor :integer_value, :prime_factor

  def check_prime
    if easy_prime?
      return { prime: true, prime_factor: nil }
    end

    if easy_prime_factors? || other_prime_factors?
      return { prime: false, prime_factor: prime_factor }
    end

    { prime: true, prime_factor: nil }
  end

  private

  def easy_prime?
    integer_value == 2 || integer_value == 3 ? true : false
  end

  def easy_prime_factors?
    digits = integer_value.digits
    units = digits.first
  
    if [0, 2, 4, 6, 8].include?(units)
      self.prime_factor = 2
    end
  
    if units == 5
      self.prime_factor = 5
    end

    sum = digits.inject(0){ |sum, x| sum + x }
    if prime_factor.nil? && sum % 3 == 0
      self.prime_factor = 3
    end

    !prime_factor.nil? ? true : false
  end

  def other_prime_factors?
    # Failsd First Checks
    # set the values for the starting equation
    # 2((n - 3)/2) + 3 = n
    # 2(n - 3)/2) - 3) + 2(3) + 3 = n
    # 2((n - 3/2) - 3) + 3(3) = n
    # 2(a) + 3(b) = n

    r = integer_value - 3
    a = (r/2 - 3)
    b = 3

    while a >= b/2
      if a % b != 0
        a -= 3
        b += 2
      else
        self.prime_factor = (a/b * 2) + 3
        break
      end
    end

    prime_factor.nil? ? false : true
  end
end
