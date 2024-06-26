# not-a-prime-sieve

_not-a-prime-sieve_ looks for primes, however, unlike many programs that look for primes, it's not really a prime sieve. While a prime sieve looks for all primes smaller than a given integer value, _not-a-prime-sieve_ takes an integer value and determines whether or not it's prime by examining its addends.

# <Line>

### How It Works

_not-a-prime-sieve_ uses the following principles to identify primes:
* Any non-prime integer greater than 3 can be expressed as the sum of 2s, 3s, or both.
* Any non-prime odd integer greater than 3 can always be expressed as either
  * the sum of only 3s OR
  * the sum of 2s and 3s such that there are an evenly distributed number of 2s to 3s in the expression.
* Conversely, any prime number greater than 3 can _never_ be expressed as
  * the sum of only 3s (because then it would be evenly divisible by 3 and NOT prime) OR
  * the sum of 2s and 3s such that there are an evenly distributed number of 2s and 3s in the expression (i.e., there will always be either one or two extra 2s in the expression).
* Therefore, any prime number greater than three can be expressed as the sum of 2s and 3s where the distribution of 2s and 3s in the expression is always uneven.

So, _not-a-prime-sieve_ checks to see if an integer greater than three can be expressed as the sum of 2s and 3s where there are an evenly distrubuted number of 2s to 3s in the expression. If not, the integer is prime.

# <Line>

<details>
  <summary>More Info</summary>
  <br>
  
 Here's how the _not-a-prime-sieve_ check works:

* Given an integer value greater than 0, it returns:
  * prime when the number is 2, 3, 5, or 7 and
  * NOT prime when the number is evenly divisible by 2, 3, or 5.
* For any reamaining integer values, it checks to see if the number can be expressed as the sum of 2s and 3s where there are an evenly distributed number of 2s and 3s by:
  * assuming the number can be expressed as the sum of at least three 3s (and possibly some 2s) and then
  * redistributing 2s and 3s in the expression (looking for an even distribution of 2s to 3s).
* If an even distribution is found, it returns:
  * NOT prime and
  * identifies a prime factor (by reducing the ratio of 3s to 2s in the expression to one 3 to some number of 2s and then summing the corresponding 3 and 2s).
* If an even distribution is NOT found, it returns:
  * prime.

  <br>
</details>

<details>
  <summary>Examples</summary>
  <br>
  
  - <details>
    <summary>Example 1: NOT prime</summary>
    <br>
    
    **Integer Value to Test: 77**

     77 can be expressed like this:
   
     ```
     11 * 7
     ```

     OR

     ```
     11 + 11 + 11 + 11 + 11 + 11 + 11
     ```

     OR

     ```
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2
     ```
     


     <br>

     **Test:**

     To test if 77 has a prime factor, test to see if it can be expressed as the sum of prime factors. That is, ask: can the integer be expressed as the sum of 2s and 3s, such that there is an even distribution of 2s and 3s in the expression? (This is how 77 is expressed in the third example.)

     <br>

     **Steps:**

     Step 1: Express 77 as the sum of three 3s and some 2s.

     ```
     2(37) + 3 = 77
     2(34) + 2(3) + 3 = 77    -> exchange 2s for 3s
     2(34) + 3(3) = 77        -> 77 expressed as the sum of three 3s and thirty-four 2s
     ```

     Step 2: Check if the 2s and 3s are evenly distributed.
    
     ```
     34/3 = 	11 1/3
     ```

     Step 3: Continue checking by exchanging 2s for 3s and checking to see if the 2s and 3s are evening distributed.

     ```
     2(34) + 3(3) = 77
     
     2(31) + 2(3) + 3(3) = 77     -> exchange 2s for 3s
     2(31) + 3(5) = 77            -> new number of 2s and 3s

     31/5 = 6 1/5                 -> not evenly distributed
     ```

     ```
     2(28) + 2(3) + 3(5) = 77     -> exchange 2s for 3s
     2(28) + 7(3) = 77            -> new number of 2s and 3s

     28/4 = 4                     -> yes, evenly distributed
     ```

     77 is NOT prime.

     Step 4: Find a prime factor.

     There are seven 3s for every twenty-eight 2s. In other words, the ratio of threes to twos is 7:28 or 1:4. So one of the prime factors will be:

     ```
     3 + 2 + 2 + 2 + 2 = 
     3 + 2(4) = 
     11
     ```   

    <br>
    </details>

  - <details>
    <summary>Example 2: Prime</summary>
    <br>
    
    **Integer Value to Test: 79**

     79 can be expressed like this:

     ```
     11 + 11 + 11 + 11 + 11 + 11 + 11 + 2
     ```

     OR

     ```
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     3 + 2 + 2 + 2 + 2 +
     2
     ```

     <br>

     **Test:**

     To test if 79 has a prime factor, test to see if it can be expressed as the sum of prime factors. That is, ask: can the integer be expressed as the sum of 2s and 3s, such that there is an even distribution of 2s and 3s in the expression?

     <br>

     **Steps:**

     Step 1: Express 79 as the sum of three 3s and some 2s.

     ```
     2(38) + 3 = 79
     2(35) + 2(3) + 3 = 79    -> exchange 2s for 3s
     2(35) + 3(3) = 79        -> 79 expressed as the sum of three 3s and thirty-five 2s
     ```

     Step 2: Check if the 2s and 3s are evenly distributed.
    
     ```
     35/3 = 	11 2/3
     ```

     Step 3: Continue checking by exchanging 2s for 3s and checking to see if the 2s and 3s are evening distributed.

     ```
     2(35) + 3(3) = 79
     
     2(32) + 2(3) + 3(3) = 79     -> exchange 2s for 3s
     2(32) + 3(5) = 79            -> new number of 2s and 3s

     32/5 = 6 2/5                 -> not evenly distributed
     ```

     ```
     2(29) + 2(3) + 3(5) = 79     -> exchange 2s for 3s
     2(29) + 7(3) = 79            -> new number of 2s and 3s

     29/7 = 4 1/7                 -> not evenly distributed
     ```

     ```
     2(26) + 2(3) + 7(3) = 79     -> exchange 2s for 3s
     2(26) + 9(3) = 79            -> new number of 2s and 3s

     26/9 = 2 8/9                 -> not evenly distributed
     ```

     ```
     2(23) + 2(3) + 9(3) = 79     -> exchange 2s for 3s
     2(23) + 11(3) = 79           -> new number of 2s and 3s

     23/11 = 2 1/11               -> not evenly distributed
     ```

     ```
     2(20) + 2(3) + 11(3) = 79    -> exchange 2s for 3s
     2(20) + 13(3) = 79           -> new number of 2s and 3s

     20/13 = 1 7/13               -> not evenly distributed
     ```

     ```
     2(17) + 2(3) + 13(3) = 79    -> exchange 2s for 3s
     2(17) + 15(3) = 79           -> new number of 2s and 3s

     17/15 = 1 2/15               -> not evenly distributed
     ```

     ```
     2(14) + 2(3) + 15(3) = 79
     2(14) + 17(3)
     ```
     
     Stop: no need to continue evaluating because now there are fewer 2s than 3s, so there cannot be an even distributionof 2s to 3s.

     79 is prime. 

  <br>
  </details>
  
</details>

<details>
  <summary>Notes</summary>
  <br>

  * As written, `#other_prime_factors?` will accurately identify 5 and 7 as prime, but more as a fluke in the way the method's written than because of the principles. Given this, I opted to check 5 and 7 in `#easy_prime?` instead.
  * `#easy_prime_factors?` handles odd integers that are evenly divisible by 3 or 5 with common checks for divisiblity. I did this for simplicity's sake.
  * I wrote _not-a-prime-sieve_ as part of my investigation into the [Beal](https://en.wikipedia.org/wiki/Beal_conjecture) and [Collatz](https://en.wikipedia.org/wiki/Collatz_conjecture) conjectures. Both conjectures are seemingly simple math problems that have yet to be solved. The first is about shared prime factors; the second is about sequential operations done with 2s and 3s. Identifying the principles behind the _not-a-prime-sieve_ calculations and writing the calculations themselves has improved my understanding of both primes and 2s and 3s, making it easier to investigate the conjectures.
  * I wrote _not-a-prime-sieve_ in Ruby because that's the language I know best - my primary goal was to get the logic written down and to run the check on at least some integers. At some point, I plan to rewrite _not-a-prime-sieve_ in Java or some other language that's better suited for performing lengthy mathematical calclations on large numbers.

  <br>
</details>

----

