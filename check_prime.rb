require_relative 'number.rb'

# get input
welcome_message = "This is a prime number checker. \n
  It works kind of like a prime sieve, 
  but it will NOT tell you all the primes smaller than a given number. 
  Instead, it will tell you if a number is prime. \n
  Note: This prime number checker is written in Ruby, 
  so it will take a LONG time to complete, if the number you provide is super big. \n
  What number do you want to check?"

puts welcome_message

test_number = gets.chomp.to_i

get_number_attempts = 0

while get_number_attempts < 2 && (test_number.nil? || test_number < 1)
  puts 'Please enter a number greater than 0:'
  test_number = gets.chomp.to_i
  get_number_attempts += 1
end

abort('Needed a number greater than 0 to run.') unless test_number > 0

# To Do: add time tracking back in and timeout after a set period of time

# puts 'Would you like to see the time it takes to complete the calculation?'

# get_track_time_attempts = 0

# while get_track_time_attempts < 2 && (track_time != true && track_time != false)
#   puts 'Please enter yes or no.'

#   track_it = gets.chomp.downcase

#   if track_it == 'yes'
#     track_time = true
#   elsif track_it == 'no'
#     track_time = false
#   end

#   get_track_time_attempts += 1
# end

# puts 'This program will not track time.' if track_time != true && track_time != false

# puts "This program will check to see if #{test_number} is prime."

# test number
number = Number.new(test_number)

# output results
output = if number.prime?
  "#{test_number} is prime."
else
  "#{test_number} is NOT prime. \n" +
  "Prime factor: #{number.prime_factor}"
end

puts output
