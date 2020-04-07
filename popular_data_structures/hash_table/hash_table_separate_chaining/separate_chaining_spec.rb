include RSpec

require_relative 'separate_chaining'

RSpec.xdescribe SeparateChaining, type: Class do
  let(:star_wars_movies) { SeparateChaining.new(6) }

  describe "#index_by_size" do
    it "creates a hash key based on the string value passed in" do
      i = star_wars_movies.index_modulus_method("Star Wars: A New Hope", 6)
      expect(i).to eq 4
    end
  end

  describe "#hash[key] = value" do
    it "does not resize the array when a collision occurs and the values match" do
      hash = SeparateChaining.new(4)
      hash["key"] = "value"
      expect(hash.size).to eq 4
      hash["key"] = "second value"
      expect(hash.size).to eq 4
    end

    it "sets the value of key to value" do
      star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
      star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
      star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
      star_wars_movies["Star Wars: A New Hope"] = "Number Four"
      star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
      star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

      expect(star_wars_movies["Star Wars: The Phantom Menace"]).to eq "Number One"
      expect(star_wars_movies["Star Wars: Attack of the Clones"]).to eq "Number Two"
      expect(star_wars_movies["Star Wars: Revenge of the Sith"]).to eq "Number Three"
      expect(star_wars_movies["Star Wars: A New Hope"]).to eq "Number Four"
      expect(star_wars_movies["Star Wars: The Empire Strikes Back"]).to eq "Number Five"
      expect(star_wars_movies["Star Wars: Return of the Jedi"]).to eq "Number Six"
    end

    context 'when there are same keys being inserted' do
      it 'retains the latest value' do
        star_wars_movies['Han'] = 'Number Seven'
        star_wars_movies['Han'] = 'Number Eight'
        star_wars_movies['Han'] = 'Solo'
        expect(star_wars_movies['Han']).to eql('Solo')
      end
    end
  end

  describe "#load_factor" do
    it "returns the number of items in the hash divided by the size of the underlying array" do
      h = SeparateChaining.new(4)

      # Load Factor starts at zero
      expect(h.load_factor == 0).to be true
      h["key"] = "value"
      h["keytwo"] = "value"

      # Load factor should be .5 when two items are added
      expect(h.load_factor).to eq 0.5
      h["keythree"] = "value"

      # Load factor goes down to .375 (3/8) since when third item is added, load factor goes to .75
      # then the resize is triggered and load factor is recalculated
      expect(h.load_factor).to eq 0.375
    end
  end

  describe "#resize" do
    it "doubles the size of the array when invoked" do
      movies = SeparateChaining.new(6)
      expect(movies.size).to eq 6
      movies.resize
      expect(movies.size).to eq 12
    end

    it "copies existing values properly when the array is resized" do
      movies = SeparateChaining.new(6)
      movies["A New Hope"] = "Average"
      movies["Empire Strikes Back"] = "Excellent"
      movies["Return of the Jedi"] = "The Best"
      movies.resize
      expect(movies.size).to eq 12
      expect(movies["A New Hope"]).to eq "Average"
      expect(movies["Empire Strikes Back"]).to eq "Excellent"
      expect(movies["Return of the Jedi"]).to eq "The Best"
    end
  end
end

RSpec.xdescribe '#Algo Evaluation storing ascending numbers' do
  h = SeparateChaining.new(8)
  1..(15000).times do |e|
    h[e.to_s] = e
    if e % 100 == 0
      items_compact = h.items.compact
      linked_list_sizes = {}
      items_compact.each do |ll|
        linked_list_sizes[ll.size.to_s] ||= 0
        linked_list_sizes[ll.size.to_s] += 1
      end
      puts "Size of hash: #{h.size}"
      puts "Occupied items #{items_compact.size}"
      puts "Distribution of LinkedList entries #{linked_list_sizes}"
    end
  end
end

RSpec.describe '#Algo Evaluation - storing random characters' do
  h = SeparateChaining.new(8)
  size_of_word = 60
  start_random = 48
  end_random = 126

  1.upto(size_of_word) do |char_size|
    1.upto(50) do |_same_char_length_loop|
      random_characters = (1..char_size).map {|_n| rand(start_random..end_random).chr}.join('')
      h[random_characters] = 'hello world'
    end
    items_compact = h.items.compact
    linked_list_sizes = {}
    items_compact.each do |ll|
      linked_list_sizes[ll.size.to_s] ||= 0
      linked_list_sizes[ll.size.to_s] += 1
    end
    puts "Size of hash: #{h.size}"
    puts "Occupied items #{items_compact.size}"
    puts "Distribution of LinkedList entries #{linked_list_sizes}"
  end
end
