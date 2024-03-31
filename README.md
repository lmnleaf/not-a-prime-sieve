# not-a-prime-sieve

This program looks for primes. 

However, unlike many programs that look for primes, it is not really a prime sieve. 

While a prime sieve looks for all primes smaller than a given integer value, this _not-a-prime-sieve_ takes the integer value and determines whether or not it's prime without running it through a sieve.

# <Line>

### How It Works

**TLDR:**

This _not-a-prime-sieve_ uses the following principles to identify primes:
* Any non-prime integer greater than 3 can be expressed as the sum of 2s, 3s, or both.
* Any non-prime odd integer greater than 3 can always be expressed as either
  1. the sum of only 3s OR
  2. the sum of 2s and 3s such that there are an evenly distributed number of 2s to 3s in the expression.
* Conversely, any prime number greater than 3 can _never_ be expressed as
  1. the sum of only 3s (because then it would be evenly divisible by 3 and NOT prime) OR
  2. the sum of 2s and 3s such that there are an evenly distributed number of 2s and 3s in the expression (i.e., there will always be either one or two extra 2s in the expression).



**LDR:**

More specifically, this _not-a-prime-sieve_ checks to see if an integer value can be expressed as the sum of 2s and 3s where there are an evenly distrubute number of 2s to 3s in the expression. Here's how:

* Given an integer value greater than 0, it returns:
  * prime when the number is 2, 3, 5, or 7 and
  * NOT prime when the number is evenly divisible by 2, 3, or 5.
* For the remaining non-prime odd integers, it checks to see if the number can be expressed as the sum of 2s and 3s where there are an evenly distributed number of 2s and 3s by:
  * assuming the number can be expressed as the sum of at least three 3s (and possibly some 2s) and
  * redistributing 3s and 2s in the expression (looking for an even distribution of 2s to 3s).
* If an even distribution is found, it returns:
  * NOT prime and
  * identifies a prime factor (by reducing the ratio of 3s to 2s in the expression to one 3 to some number of 2s and then summing the corresponding 3 and 2s).
* If an even distribution is NOT found, it returns:
  * prime.

<details>
  <summary>Examples</summary>
  <br>
  
  <details>
  <summary>Example 1: NOT prime</summary>
  <br>
    
   Integer Value to Test: 77

   77 can be expressed like this:
   
   ```
   11 * 7

   OR

   11 + 11 + 11 + 11 + 11 + 11 + 11

   OR

   3 + 2 + 2 + 2 + 2 +
   3 + 2 + 2 + 2 + 2 +
   3 + 2 + 2 + 2 + 2 +
   3 + 2 + 2 + 2 + 2 +
   3 + 2 + 2 + 2 + 2 +
   3 + 2 + 2 + 2 + 2 +
   3 + 2 + 2 + 2 + 2
   ```

  <br>
  </details>
  
  <br>
</details>
