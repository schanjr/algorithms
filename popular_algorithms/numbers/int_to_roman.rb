# https://leetcode.com/problems/integer-to-roman/

def int_to_roman(num)
  map = { 1000 => "M",
          900 => "CM",
          500 => "D",
          400 => "CD",
          100 => "C",
          90 => "XC",
          50 => "L",
          40 => "XL",
          10 => "X",
          9 => "IX",
          5 => "V",
          4 => "IV",
          1 => "I"
  }
  roman = ""
  map.each do |number, letter|
    while num / number > 0
      puts "Current num: #{num}"
      roman += letter
      num -= number
    end
  end
  roman
end

puts int_to_roman(1234)