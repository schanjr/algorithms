# The left pointer continuously moves one cell to the right until it reaches a value that is greater than or equal to the pivot, and then stops.
#
# Then, the right pointer continuously moves one cell to the left until it reaches a value that is less than or equal to the pivot, and then stops.
#
# We swap the values that the left and right pointers are pointing to.
#
# We continue this process until the pointers are pointing to the very same value or the left pointer has moved to the right of the right pointer.
#
# Finally, we swap the pivot with the value that the left pointer is currently pointing to.
#

# Quick sort is the default sort algorithm for standard libraries.
class SortableArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def partition!(left_pointer, right_pointer)
    return if right_pointer - left_pointer <= 0


    # We always choose the right most element as the pivot
    pivot_position = right_pointer
    pivot = @array[pivot_position]
    # Exclude the pivot from the comparisons
    right_pointer -= 1
    loop do
      count = 0
      if @array[left_pointer] <= pivot
        left_pointer += 1
      elsif @array[right_pointer] >= pivot
        right_pointer -= 1
      else
        swap(left_pointer, right_pointer)
      end
      if left_pointer >= right_pointer
        # Don't swap if the pointer value is actually bigger than the left_pointer value
        break if @array[left_pointer] <= pivot

        swap(left_pointer, pivot_position)
        break
      end
      count += 1
      puts "left_pointer: #{left_pointer}, right_pointer: #{right_pointer}"
      puts "loop #{count}: #{@array.to_s}"
    end
    puts "After swapping left_pointer: #{left_pointer} right_pointer: #{right_pointer}"
    partition!(0, pivot_position - 1)
    partition!(pivot_position + 1, right_pointer)
  end

  def swap(pointer_1, pointer_2)
    temp_value = @array[pointer_1]
    @array[pointer_1] = @array[pointer_2]
    @array[pointer_2] = temp_value
  end

  def quick_sort
    puts "Starting position #{@array.to_s}"
    partition!(0, (@array.size - 1))
    puts "Ending position #{@array.to_s}"
  end
end


ar = [3,2,1,4,5]

sortable_array = SortableArray.new(ar)
sortable_array.quick_sort


