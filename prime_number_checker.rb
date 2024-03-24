require 'pry-byebug'

class PrimeNumberChecker
  def initialize number, track_time
    @number = number
    @track_time = track_time
  end

  attr_accessor :number, :prime, :prime_factor, :elapsed_time, :track_time

  def check_number
    if track_time
      prime_check_with_time_calculation
    else
      prime_check
    end
  
    result
  end

  private

  def prime_check
    return true if number == 2 || number == 3
  
    self.prime = false
  
    digits = number.digits
    units = digits.first
  
    if [0, 2, 4, 6, 8].include?(units)
      self.prime_factor = 2
      return
    end
  
    if units == 5
      self.prime_factor = 5
      return
    end
  
    sum = digits.inject(0){ |sum, x| sum + x }
    if sum % 3 == 0
      self.prime_factor = 3
      return
    end
  
    check_any_prime_factors
  end

  def prime_check_with_time_calculation
    start_time = Process.clock_gettime(Process::CLOCK_REALTIME)

    prime_check

    end_time = Process.clock_gettime(Process::CLOCK_REALTIME)

    start_min = end_time.to_f * 1000
    end_min = end_time.to_f * 1000

    elapsed_time = end_min - start
  end

  def check_any_prime_factors
    # Failsd First Checks
    # set the values for the starting equation
    # 2((n - 3)/2) + 3 = n
    # 2(n - 3)/2) - 3) + 2(3) + 3 = n
    # 2((n - 3/2) - 3) + 3(3) = n
    # 2(a) + 3(b) = n
    r = number - 3
    a = (r/2 - 3)
    b = 3

    prime = false

    while a >= b/2
      if a % b != 0
        prime = true
        a -= 3
        b += 2
      else
        prime = false
        self.prime_factor = (a/b * 2) + 3
        break
      end
    end
  end

  def result
    output = if prime == true
      "#{number} is prime"
    else
      "#{number} is NOT prime \n" +
      "Prime factor: #{prime_factor}"
    end

    if track_time
      output = output + 
        "\n Elapsed Time: #{elapsed_time}"
    end

    output
  end
end
