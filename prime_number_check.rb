def odd_number? number
  digits = number.digits
  evens = [0, 2, 4, 6, 8]
  units_value = digits.first
  puts "Prime Factor: 2" if evens.include?(units_value)
  return true unless evens.include?(units_value)
end

def divisible_by_five? number
  puts "Prime Factor: 5" if number.digits.first == 5
  return true if number.digits.first == 5
end

def divisible_by_three? number
  digits = number.digits
  sum = digits.inject(0){ |sum, x| sum + x }
  divisible_by_3 = sum % 3 == 0
  puts "Prime Factor: 3" if divisible_by_3
  return true if divisible_by_3
end

# Reasoning:
# check for divisiblity by easy numbers first
# 2, 3, 5

# then think of any odd number as a combination of 2s and 3s
# i.e., some number of 2s are added to some number of 3s
# ex: 3(1) + 2(1) = 5
# ex2: 3(1) + 2(2) = 7
# ex3: 3(3) + 2(6) + 2(1) = 3(3) + 2(7) = 3(5) + 2(4) = 3(7) + 2(1) = 23
# ex4: 3(3) + 2(10) = 3(5) + 2(7) = 3(7) + 2(4) = 3(9) + 2(1) = 29

# to get the variations, subtract three 2s and add two 3s (because 2 * 3 = 6, so it's the converstion rate)

# now to determine whether or not a given odd number is prime,
# we can assume that the number is some additive combo of 2s and 3s (so some number of 2s and some number of 3s
# add together to equal that number)
# when a number is NOT prime, i.e., composite, it will be able to be broken up in such a way
# that each 3 (or set of 3s), gets a corresponding and even distributed number of 2s
# ex: 3(3) + 2(6) = 21
# so for every 1 three, there are 2 (2s)
# 21 could be written like this:
# 3(5) + 2(3) = 21 
# in that case, you can think of it as for each 5, there's an even distributed number of 2s

# so to check if a number is prime, we have to figure out whether or not we can 
# express the number in terms of 2s and 3s, where each 3 or set of 3s has an even distributed number of 2s
# if it does, it's composite
# if it doesn't, it's prime

# we can do this by expressing the number as 2s and 3s
# to do this, we start with three 3s, so 3(3) + something
# we start here because it gives us something easy to work with
# (((n - 3)/2)) - 3)(2) + 3(3) = n
# Side Note 1: when we subtract 3 from (n - 3)/2, we're really subtracting 2(3) from n
# since each half loses a 3, hence (((n - 3)/2)) - 3)(2) + 3(3) = n (end note)
# Side Note 2: if we started with one 3, we'd do (n - 3)/2 + 3, but that's trivial, 
# because of course n - 3 = 2(n - 3) and there's one 3 for every 2(n - 3) (end note)
# then we check if the coefficient of 2, i.e., (n - 3/2) - 3, is divisible by 3
# if it is, however many 2s plus 3(3s) gives us a factor of n
# and if there's a factor of n, then there's a prime factor (and at least one prime factor would be 3)
# if the coefficient of two is NOT divisible by 3, then we start converting 2s to 3s and keep going
# to convert 2s to 3s, we subtract 3 from the coefficient of 2 and add 2 to the coefficient of 3
# ex: n = 85
# (85 - 3)/2 = 41
# (41 - 3)(2) + 3(3) = 85
# 2(38) + 3(3) = 85
# but 38 is not evenly divisible by 3, so move on
# Code Note: we could skip this step, since if this was the case, the number would be divisible by 3 (end note)
# when we move on, we convert 2s to 3s
# 2(38 - 3) + 3(3 + 2) = 2(35) + 3(5) = 85
# Code Note: we can skip this step too (end note)
# 35 is evenly divisible by 5, so twos and threes can be evenly distributed, and the number is  not prime
# in addition, now we know that the smallest prime factor is 5 (coefficient of three in this case)
# but a guaranteed prime factor is coefficient of 2 divided by coefficient of 3 times 2 plus 3
# why?
# in the example above, for every one 3, we get 7 twos, so 2(35/5) + 3 is a factor of 85
# and coefficient of 3 * that is 85
# but how do we know that 2(coefficient of 2/coefficient of 3) + 3 will be prime?
# Code Note: I think I got this prime factor part ^^ wrong - I think the smallest prime factor
# will be the coefficient of 3; yes, that's correct (end note)


# which is really no different than dividing by
# every odd number up to n/2
# so we can start skipping some of them like 3, 5, and then multiples of 3 and 5 and once we check 7, multiples of 7 and so on
# so then it's weird because it's kind of like a prime sieve

def is_it_prime? number
  puts "Number: #{number}"

  return true if number == 2 || number == 3

  return false unless odd_number?(number)
  return false if divisible_by_three?(number)
  return false if divisible_by_five?(number)

  prime = false

  remaining = number - 3
  coefficient_two = (remaining/2 - 3)
  coefficient_three = 3

  approx_half = number/2
  stopping_value = remaining
  count = 1

  # puts "Stopping Value: #{stopping_value}"
  # puts "Coefficient Two: #{coefficient_two}"

  while stopping_value >= approx_half
    # puts "Test #{count} Coefficient Two Value: #{coefficient_two}"
    # puts "Test #{count} Coefficiet Three Value: #{coefficient_three}"

    if coefficient_two % coefficient_three == 0
      # puts "2(#{coefficient_two}) + 3(#{coefficient_three})"
      prime = false
      total_value_twos = (coefficient_two/coefficient_three) * 2
      prime_factor = total_value_twos + 3
      puts "Number: #{number}"
      puts "Prime Factor (Not 2 or 3): #{prime_factor}"
      break
    else
      prime = true
      stopping_value = coefficient_two * 2
      coefficient_two -= 3
      coefficient_three += 2
    end

    # puts "Prime Test #{count} Value: #{prime}"
  end
  puts "#{number} is prime: #{prime}"
  prime
end

# is_it_prime? 1007

is_it_prime? 998244359

# biggest prime under 1 billion: 998244353

# test_cases = [
#   2, 3, 5, 7,
#   11, 13, 17, 19,
#   23, 29,
#   31, 37,
#   41, 43, 47,
#   53, 59,
#   61, 67,
#   71, 73, 79,
#   83, 89,
#   97
# ]

# test_cases = [
#   1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
#   11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
#   21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
#   31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
#   41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
#   51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
#   61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
#   71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
#   81, 82, 83, 84, 85, 86, 87, 88, 89, 90,
#   91, 92, 93, 94, 95, 96, 97, 98, 99, 100
# ]

# test_cases = [
#   1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
#   100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
#   200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299,
#   300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 
#   400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 
#   500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 
#   600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690, 691, 692, 693, 694, 695, 696, 697, 698, 699,
#   700, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799,
#   800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856, 857, 858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 893, 894, 895, 896, 897, 898, 899, 
#   900, 901, 902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943, 944, 945, 946, 947, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994, 995, 996, 997, 998, 999, 1000
# ]

# results = []
# test_cases.each do |test_case| 
#   if is_it_prime?(test_case)
#     results << test_case
#   end
# end

# primes_under_one_hundred = [
#   2, 3, 5, 7,
#   11, 13, 17, 19,
#   23, 29,
#   31, 37,
#   41, 43, 47,
#   53, 59,
#   61, 67,
#   71, 73, 79,
#   83, 89,
#   97
# ]

# primes_under_one_thousand = [
#   2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
#   101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199,
#   211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293,
#   307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397,
#   401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499,
#   503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599,
#   601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691,
#   701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797,
#   809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887,
#   907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997
# ]

# match = false
# results.each do |result|
#   if primes_under_one_thousand.include?(result)
#     match = true
#   else
#     puts "Result doesn't match: #{result}"
#     match = false
#     break
#   end
#   match
# end

# if match
#   puts "This list is correct"
# else
#   puts "Nope!"
# end

# test_cases = [999983]

# # test_cases = [9973]

# test_cases = [1033]

# test_cases = [1299827]

# test_cases = [29996224275833]
# didn't let it run for this ^^

# test_cases = [998244353] # prime (according to the internet)
# test_cases = [998244351] not prime (according to hte internet)
# test_cases = [332748117] note that 332748117 * 3 = 998244353

# test_cases = [2147483647]

# test_cases = [1000000000000000003]

# # test_cases = [979]
# # test_cases = [7204543395]
# test_cases.each do |test_case| 
#   prime = is_it_prime?(test_case)
#   prime ? final_value = "Prime" : final_value = "Not Prime"
#   puts "#{test_case}: #{final_value}"
# end
