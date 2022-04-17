# https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/273/
#
# 232,006,987
# 1. The current three digits place. Ex: Two hundred thirty two
# 2. Its relative place in the number, Ex: million
# 3. Move to next three numbers if not zero. Repeat Step one. Ex: Six thousand
# @param {Integer} num
# @return {String}
def number_to_words(num)
  return "Zero" if num == 0
  size = {
    4 => "Billion",
    3 => "Million",
    2 => "Thousand"
  }
  edge_case_tenth_size = {
    "10" => "Ten",
    "11" => "Eleven",
    "12" => "Twelve",
    "13" => "Thirteen",
    "14" => "Fourteen",
    "15" => "Fifteen",
    "16" => "Sixteen",
    "17" => "Seventeen",
    "18" => "Eighteen",
    "19" => "Nineteen"
  }
  tenth_size = {
    "2" => "Twenty",
    "3" => "Thirty",
    "4" => "Forty",
    "5" => "Fifty",
    "6" => "Sixty",
    "7" => "Seventy",
    "8" => "Eighty",
    "9" => "Ninety"
  }
  one_size = {
    "1" => "One",
    "2" => "Two",
    "3" => "Three",
    "4" => "Four",
    "5" => "Five",
    "6" => "Six",
    "7" => "Seven",
    "8" => "Eight",
    "9" => "Nine"
  }

  to_ar = num.to_s.chars
  grouped = []

  until to_ar.empty?
    if to_ar.size >= 3
      grouped.insert(0, to_ar.slice!(-3, 3))
    else
      grouped.insert(0, to_ar.slice!(0, 3))
    end
  end
  translated = ""
  index = 0
  until index == grouped.size do
    curr = grouped[index]
    all_zeroes = true

    if curr.size == 3
      unless curr[0] == "0"
        translated += "#{one_size[curr[0]]}" + " Hundred "
        all_zeroes = false
      end
      curr.shift
    end

    if curr.size == 2
      unless curr[0] == "0"
        if curr[0] == "1"
          translated += "#{edge_case_tenth_size[curr[0, 2].join]} "
          curr.shift # shift twice
        else
          translated += "#{tenth_size[curr[0]]} "
        end
        all_zeroes = false
      end
      curr.shift
    end

    if curr.size == 1
      unless curr[0] == "0"
        translated += "#{one_size[curr[0]]} "
        all_zeroes = false
      end
      curr.shift
    end

    if all_zeroes
      index += 1
      next
    end

    current_place = grouped.size - index

    if current_place > 1
      translated += "#{size[current_place]} "
    end

    index += 1
  end
  translated.rstrip
end
