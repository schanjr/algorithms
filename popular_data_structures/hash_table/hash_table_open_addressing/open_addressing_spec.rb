include RSpec

require_relative 'node'
require_relative 'open_addressing'

RSpec.describe '#Algo Evaluation storing ascending numbers' do
  it '1 to 1000' do
    h = OpenAddressing.new(8)
    1..(15000).times do |e|
      h[e.to_s] = e
      puts e
      if e % 5 == 0
        puts "Size of hash: #{h.size}"
        puts "Missing Hash values: #{find_missing(h, e)}"
        puts
      end
    end
  end
end

def find_missing(array, size)
  missing_items = []
  0.upto(size) do |index|
    missing_items << index if array[index.to_s].nil?
  end
  missing_items
end
