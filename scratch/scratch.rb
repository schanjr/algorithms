def min_flips_mono_incr(s)
  cur = s.count('0')
  ans = cur
  s.each_char do |c|
    if c == '0'
      cur -= 1
    else
      cur += 1
    end
    ans = cur if ans > cur
  end
  ans
end

