# Most amazing implementation.

class Stacks < Array
  alias :enqueue :push
  alias :dequeue :pop
end

stacks = Stacks.new
stacks.enqueue(5)
stacks.enqueue(4)
stacks.enqueue(10)

puts stacks.dequeue
puts stacks.dequeue
puts stacks.dequeue
