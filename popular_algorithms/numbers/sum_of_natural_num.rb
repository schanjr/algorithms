# Never knew you can create binaries like this. Anyone know what is the thinking behind?

## recursion
def sum_natural_num_recursion(number)
  if number == 0
    return number
  end
  sum = number + sum_natural_num_recursion(number-1)
  sum
end


## loop
def sum_natural_num_looping(number)
  sum = 0
  curr_num = 0
  until curr_num > number
    sum += curr_num
    curr_num += 1
  end
  sum
end


answers = {
  10 => 55
}

answers.each do |number, answer|
  puts "Number: #{number} || Answer #{answer} ||  sum_natural_num_recursion: #{sum_natural_num_recursion(number)} || sum_natural_num_looping: #{sum_natural_num_looping(number)}"
end



