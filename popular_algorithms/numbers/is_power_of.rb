# https://leetcode.com/problems/power-of-three/solution/
# An important piece of information can be deduced from the function signature
# In particular, n is of type int. In Java, this means it is a 4 byte, signed integer [ref]. The maximum value of this data type is 2147483647. Three ways of calculating this value are
#
# - Google
# - System.out.println(Integer.MAX_VALUE);
# - max_int = ((2 ** 32) / 2) - 1   -- since 32 bit is used to represent an integer, half of the range is used to represent negative numbers, and zero is also used
#
# Knowing the limitation of n, we can now deduce that the maximum value of n that is also a power of three is 1162261467. We calculate this as:
# - log3(max_int) = 19.56..
# - rounded down to whole number 19. The biggest whole number that can be stored for base 3: 3 ^ 19
# - 3 ^ 19 == 1162261467
#
# Therefore, the possible values of n where we should return true are 3^1, 3^2, 3^3...
# Since 3 is a prime number, the only divisors of 3^19 are 3^0, 3^1, 3^3. therefore all we need to do is divide 3^(19) by n
# A remainder of 0 means n is a divisor of 3^19 and therefore a power of three.
#
# Complexity Analysis
#
# Time complexity : O(1)O(1). We are only doing one operation. (if we figure out the max_power before hand)
# Space complexity : O(1)O(1). We are not using any additional memory.
#
# This method only works for PRIME NUMBERS.
def is_power_of?(base_number, n)
  max_int = ((2 ** 32) / 2) - 1
  max_power = base_number ** Math.log(max_int, base_number).floor
  n > 0 && max_power % n == 0
end
