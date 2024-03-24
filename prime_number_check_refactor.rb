
def prime? n
  return true if n == 2 || n == 3

  prime = false
  passesFirstChecks = false
  statement = ''

  d = n.digits
  u = d.first

  # check if divisible by 2
  if [0, 2, 4, 6, 8].include?(u)
    puts "Divisible by 2"
    passesFirstChecks = true
  end

  if u == 5
    puts "Divisible by 5"
    passesFirstChecks = true
  end

  sum = d.inject(0){ |sum, x| sum + x }
  if passesFirstChecks == false && sum % 3 == 0
    puts "Divisible by 3"
    passesFirstChecks = true
  end

  if passesFirstChecks == false
    puts "Failed First Checks"
    # set the values for the starting equation
    # 2((n - 3)/2) + 3 = n
    # 2(n - 3)/2) - 3) + 2(3) + 3 = n
    # 2((n - 3/2) - 3) + 3(3) = n
    # 2(a) + 3(b) = n
    r = n - 3
    a = (r/2 - 3)
    b = 3

    prime = false
    f = nil

    while a >= b/2
      if a % b != 0
        prime = true
        a -= 3
        b += 2
      else
        prime = false
        f = (a/b * 2) + 3
        puts "Prime Factor: #{f}"
        break
      end
    end
  end

  if prime == true
    statement = "#{n} is prime"
  else
    statement = "#{n} is NOT prime"
  end

  puts "#{statement}"
end

puts "Please enter a number: "
num = gets.chomp.to_i

# start_time = Time.now
start_time = Process.clock_gettime(Process::CLOCK_REALTIME)
prime?(num)
end_time = Process.clock_gettime(Process::CLOCK_REALTIME)
# end_time = Time.now
start_m = end_time.to_f * 1000
end_m = end_time.to_f * 1000
puts start_m
puts end_m
elapsed = end_m - start_m
puts "Elapsed Time: #{elapsed}"

# Example 1
# n = 71
# r = 71 - 3
# r = 68
# a = 68/2 = 34
# 2(34) + 3 = 71
# 2(34 - 3) + 2(3) + 3 = 71
# 2(31) + 3(3) = 71
# Is 31 divisible by 3? No.
# 2(31 - 3) + 2(3) + 3(3) = 71
# 2(28) + 5(3) = 71
# Is 28 divisible by 5? No.
# 2(28 - 3) + 2(3) + 5(3) = 71
# 2(25) + 7(3) = 71
# Is 25 divisible by 7? No.
# 2(25 - 3) + 2(3) + 7(3) = 71
# 2(22) + 9(3) = 71
# Is 22 divisible by 9? No.
# 2(22 - 3) + 2(3) + 9(3) = 71
# 2(19) + 3(11) = 71
# Is 19 divisible by 11? No.
# And don't go any farther because
# all other a values will be less than twice as big
# as b values, so a values cannot be evenly divided
# by b values

# Example 2
# n = 51
# r = 51 - 3
# r = 48
# a = 48/2 = 24
# 2(24) + 3 = 51
# 2(21) + 3(3) = 51
# Is 21 divisible by 3? Yes
# Ration 2:3? 7:1
# 2(7) + 3 = 17
# Next largest prime factor after 2 or 3 is 17.
# Smallest prime factor, if it's not divisible by 2 or 3.

# Example 3
# n = 15
# 2(6) + 3 = 15
# 2(3) + 3(3) = 15
# Is 3 divisible by 3? Yes.
# Prime Factor Ration 2:3? 1:1
# 2 + 3 = 5
# Smallest prime factor after 2 or 3 is 5.

# so the above is why eliminate numbers divisible by
# 2 and 3 first
# and stop should be where a <= 1/2(b)
# but it was working where a(2) >= 1/2(n)
# (i.e., coefficient of 2 in the step * 2 is greater than or equal to half the starting number)
# that doesn't make any sense - is that what I was doing? why?


