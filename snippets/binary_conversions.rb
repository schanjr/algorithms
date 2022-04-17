def bin_num_to_num(binary_num)
  # simple binary number to number
  binary_num.to_i(2)
end

def bin_ascii_to_str(binary_ascii_str)
  # "01001000" ==  49, or "H" in ascii
  binary_ascii_str.to_i(2).chr
end

def ascii_to_bin(ascii)
  # "a" ==> 97 ==> "1100001"
  ascii.ord.to_s(2)
end
