require 'set'

# https://leetcode.com/problems/remove-invalid-parentheses/
# @topics algorithms -
#   - backtracking
#   - recursion
def remove_invalid_parentheses(s)
  # Initialize a queue to store the strings that need to be processed
  queue = [s]
  # Initialize a set to store the strings that have already been processed
  visited = Set.new
  # Initialize a flag to keep track of whether we have found a valid string
  found = false
  results = []
  # Loop through the queue
  while !queue.empty? do
    # Get the next string from the queue
    str = queue.shift
    # Check if the string is valid
    if valid_string?(str)
      # If it is valid, add it to the results and set the found flag to true
      found = true
      results << str
    end
    # If we have already found a valid string, we can stop processing the queue
    next if found
    # Otherwise, we need to remove one character at a time and add the modified strings to the queue
    (0...str.length).each do |i|
      # Only consider removing characters that are parentheses
      next unless str[i] == '(' || str[i] == ')'
      # Remove the character at index i
      modified_str = str[0...i] + str[i+1..-1]
      # Skip this string if we have already processed it
      next if visited.include?(modified_str)
      # Add the modified string to the queue and the visited set
      queue << modified_str
      visited.add(modified_str)
    end
  end

  # Return the results
  results
end

# This helper function checks if a string is valid
def valid_string?(str)
  # Initialize a counter to keep track of the number of open parentheses
  counter = 0
  # Loop through the characters in the string
  str.each_char do |c|
    # If we encounter an open parenthesis, increment the counter
    counter += 1 if c == '('
    # If we encounter a close parenthesis, decrement the counter
    counter -= 1 if c == ')'
    # If the counter becomes negative, the string is invalid
    return false if counter < 0
  end
  # If the counter is not zero, the string is invalid
  return counter == 0
end

# puts remove_invalid_parentheses(")(f")
# puts remove_invalid_parentheses("())(()")
puts remove_invalid_parentheses("()())()")
