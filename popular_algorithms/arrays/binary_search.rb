def binary_search(arr, val, cmp="to_val")
  search = partition(arr, 0, (arr.length), val, cmp)
  return -1 if search.nil?
  search
end

def partition(arr, start, last, val, cmp)
  median = (start + last) / 2
  # condition for exiting the function if the value is not in the array at all.
  return nil if start == last && send(cmp.to_sym, arr[median]) != val

  if send(cmp.to_sym, arr[median]) == val #arr[median] == val
    return find_left_most_index(arr, median, val)
  end

  median_remainder = (arr.length - 1) % 2
  if median_remainder
    if send(cmp.to_sym, arr[median + median_remainder]) == val # arr[median + median_remainder] == val
      return arr[median + median_remainder]
    end
  end

  if send(cmp.to_sym, arr[median]) > val # arr[median] > val
    return partition(arr, start, median, val, cmp)
  elsif send(cmp.to_sym, arr[median]) < val # arr[median] <  val
    return partition(arr, median+1, last, val, cmp)
  end
end

def find_left_most_index(arr, index, val)
  until arr[index - 1] != val
    index -= 1
  end
  index
end

def to_val(val1)
  val1
end

def bin_num_to_num(binary_num)
  # simple binary number to number
  binary_num.to_i(2)
end

def bin_ascii_to_str(binary_ascii_str)
  # "01001000" ==  49, or "H" in ascii
  binary_ascii_str.to_i(2).chr
end


arr = [1, 2, 2, 2, 3, 4, 5, 6]


################ Assertions
# out of index, left most
puts binary_search(arr, 0) == -1
# out of index, right most
puts binary_search(arr, 9) == -1
# duplicates, value is present, show the left most value
puts binary_search(arr, 2) == 1
# happy path
puts binary_search(arr, 3) == 4


################
# parse binary number and find it with an equivalent number
# Ex: 1,2,3,4,5,6,7,8
arr = %w[1 10 11 100 101 110 111 1000]
# you may test this with
# puts bin_num_to_num(5)

puts binary_search(arr, 2, "bin_num_to_num") == 1


#################
# parse binary ascii like "A", "B", "C" and  find it with equivalent value
# ex: ABCDEFG
arr = %w[01000001 01000010 01000011 01000100 01000101 01000110 01000111]

puts binary_search(arr, "F", "bin_ascii_to_str") == 5