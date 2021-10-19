# Never knew you can create binaries like this. Anyone know what is the thinking behind?
def d_to_b_recursion(number, str = '')
  if number == 0
    return str
  end
  new_num = number / 2
  str = "#{number % 2}" + str
  d_to_b_recursion(new_num, str)
end

def d_to_b_loop(number)
  str = ""
  while number > 0
    str = "#{number % 2}" + str
    number = number / 2
  end
  return str
end

answers = {
  233 => 11101001,
  8 => 1000,
  6573 => 1100110101101
}

answers.each do |number, answer|
  puts "Number: #{number} || Answer #{answer} ||  d_to_b_recursion: #{d_to_b_recursion(number)}, d_to_b_loop: #{d_to_b_loop(number)}"
end



