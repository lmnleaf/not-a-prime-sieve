require_relative 'prime_number_checker.rb'

welcome_message = "This is a prime number checker. \n
  It works kind of like a prime sieve, 
  but it will NOT tell you all the primes smaller than a given number. 
  Instead, it will tell you if a number is prime. \n
  Note: This prime number checker is written in Ruby, 
  so it will take a LONG time to complete, if the number you provide is very big. \n
  What number do you want to check?"

puts welcome_message

number = gets.chomp.to_i

puts "Do you want to view start and end time to get a sense of how long the calculation takes?"

track_time = gets.chomp.downcase

attempts = 0
track_time = nil

while attempts < 3 && (track_time != true && track_time != false)
  if track_time == 'yes'
    track_time = true
  elsif track_time == 'no' || track_time == nil
    track_time = false
  else
    puts "Do you want to see view start and end time
      to get a sense of how long the calculation takes?
      Please enter yes or no."
    attempts += 1
    track_time = false
  end
end

checker = PrimeNumberChecker.new(number, track_time)
puts checker.check_number

