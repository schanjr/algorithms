def find_k(k, arr)
  quick_sort(arr, 0, arr.size - 1)
  puts arr.to_s
  arr[k]
end

def quick_sort(arr, l, r)
  if l < r
    p = partition(arr, l, r)
    quick_sort(arr, l, p - 1)
    quick_sort(arr, p + 1, r)
  end
end

def partition(arr, l, r)
  pivot = arr[r]
  i = l - 1
  i.upto(r) do |j|
    break if arr[j].nil? || pivot.nil?
    if arr[j] < pivot
      i += 1
      swap(arr, i, j)
    end
  end

  swap(arr, i + 1, r)
  i + 1
end

def swap(arr, left, right)
  return if arr[left].nil? || arr[right].nil?
  arr[left], arr[right] = arr[right], arr[left]
end

puts find_k(3, [4, 1, 6, 3, 7, 8])

