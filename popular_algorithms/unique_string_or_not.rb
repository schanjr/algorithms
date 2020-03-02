require 'set'
require_relative '../support_tools/easy_benchmark'


# Tempting one-liner method
def set_unique_string?(str)
  str.length == str.split('').to_set.length
end


# Most efficient method? :)
def bitwise_unique_string?(str)
  char_index = 0
  str.each_char do |char|
    # Assuming characters are upper case and lower case included, and ascii characters below bit 65
    # is not used.
    # The letter 'A' is represented as 65. We minus all of the previous numbers in order to
    # avoid creating an unnecessary gigantic char_index number.
    bit_char = 1 << (char.ord - 65)
    # puts "Current character is: #{char}"
    return false if (char_index & bit_char) > 0
    char_index |= bit_char
  end
  true
end

input = 'abcdefghijklmnop!#@$%^qrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZA'

test1 = ['Set', :set_unique_string?]
test2 = ['Bitwise', :bitwise_unique_string?]

EasyBenchmark.benchmark_time([test1,test2], input)

