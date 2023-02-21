# def add_to_array_form(num, k)
#   leftover = 0
#   k = k.to_s
#   k_index = k.size - 1
#   (num.size - 1).downto(0).each do |index|
#     break if k_index < 0
#     number = num[index] + k[k_index].to_i + leftover
#     if number > 9
#       leftover = 1
#       ones_place = number.to_s[-1]
#       num[index] = ones_place.to_i
#     else
#       num[index] = number
#       leftover = 0
#     end
#     k_index -= 1
#   end
#   num.unshift(leftover) if leftover > 0
#   num
# end
def add_to_array_form(num, k)
  final = num.join.to_i + k
  output = []
  final.to_s.each_char do |num|
    output << num.to_i
  end
  output
end

puts add_to_array_form([2,1,5], 806).to_s