# This is mainly for demonstrative purposes. In Ruby, Arrays.new are already has dynamic size increase
# functionality. Some implementations might not make sense if you're well versed in ruby. :)

class DynamicCircularBuffer
  def initialize(size = 8)
    @buffer = Array.new(size)
    reset_pointers
  end

  def clear
    @buffer = Array.new(size)
    reset_pointers
  end

  def enqueue(value)
    resize if full?
    return @buffer[@tail_pointer] = value if @buffer[@tail_pointer].nil?
    @tail_pointer = (@tail_pointer + 1) % size
    @buffer[@tail_pointer] = value
  end

  def dequeue
    return nil if empty?
    value = @buffer[@head_pointer]
    @buffer[@head_pointer] = nil
    return value if empty?
    @head_pointer = (@head_pointer + 1) % size
    value
  end

  def size
    @buffer.size
  end

  def resize
    # O(n ** 2) - probably can be O(N) if we merge some of the #enumerate logic into here.
    old_size = size
    new_array = Array.new(old_size * 2, default = nil)
    old_array = self.enumerate
    old_array.each_with_index do |item, index|
      new_array[index] = item
    end
    @buffer = new_array
    @head_pointer = 0
    @tail_pointer = (old_size - 1)
  end

  def enumerate
    temp = []
    head = @head_pointer
    if @head_pointer < @tail_pointer
      until head == @tail_pointer
        temp.push(@buffer[head])
        head += 1
      end
    else
      head.upto(size - 1) do |index|
        temp.push(@buffer[index])
      end
      0.upto(@tail_pointer) do |index|
        temp.push(@buffer[index])
      end
    end
    temp
  end

  def empty?
    @buffer[@head_pointer].nil? && @head_pointer == @tail_pointer
  end

  def full?
    @head_pointer == (@tail_pointer % size) + 1
  end

  def reset_pointers
    @head_pointer = 0
    @tail_pointer = 0
  end

  def info
    puts "buffer: #{@buffer}"
    puts "head: #{@head_pointer}"
    puts "tail: #{@tail_pointer}"
  end
end

dcb = DynamicCircularBuffer.new(4)
dcb.enqueue(5)
dcb.enqueue(3)
dcb.enqueue(1)
dcb.enqueue(0)
dcb.info
dcb.dequeue
dcb.info
dcb.dequeue
dcb.info
dcb.dequeue
dcb.info
dcb.dequeue
dcb.info
dcb.dequeue
dcb.info

dcb.enqueue(5)
dcb.enqueue(3)
dcb.enqueue(1)
dcb.enqueue(0)
dcb.info
dcb.enqueue(10)
dcb.info
