# This is mainly for demonstrative purposes. In Ruby, Arrays.new are already has dynamic size increase
# functionality. Some implementations might not make sense if you're well versed in ruby. :)

class DynamicCircularBuffer
  def initialize(size = 8)
    @buffer = Array.new(size)
    reset_pointers
  end

  def clear
    @buffer.clear
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
    # O(n)
    old_size = size
    new_array = Array.new(old_size * 2, default = nil)
    @buffer = populate_new_array(new_array)
    @head_pointer = 0
    @tail_pointer = (old_size - 1)
  end

  def populate_new_array(new)
    head = @head_pointer
    if @head_pointer < @tail_pointer
      until head == @tail_pointer
        new[head] = @buffer[head]
        head += 1
      end
    else
      count = 0
      head.upto(size - 1) do |index|
        new[count] = @buffer[index]
        count += 1
      end
      0.upto(@tail_pointer) do |index|
        new[count] = @buffer[index]
        count += 1
      end
    end
    new
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
