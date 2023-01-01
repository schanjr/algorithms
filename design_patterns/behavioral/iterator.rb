# The Iterator design pattern is a behavioral design pattern that allows you to access the elements of a collection sequentially without exposing
# the underlying representation of the collection. It does this by providing an iterator that implements a common interface for traversing the collection,
# and allowing the client code to use the iterator to access the elements of the collection.
#
# Imagine that you are building a system for a library that allows users to browse and check out books. The system has a Library class that represents
# the library, and a Book class that represents the books in the library. The Library class has a books attribute that stores the books in the
# library, and a check_out method that allows a user to check out a book.
#
# To implement this scenario using the Iterator design pattern, you could define an Iterator class that represents an iterator for the library, and a
# LibraryIterator class that implements the Iterator interface for the Library class. The LibraryIterator class has a current method that returns
# the current book in the iteration, a next method that advances the iteration to the next book, and a done method that returns true if the iteration
# is complete and false if it is not.
#


# The Iterator class represents an iterator for a collection. It has a current
# method that returns the current element in the iteration, a next method that
# advances the iteration to the next element, and a done method that returns
# true if the iteration is complete and false if it is not.
class Iterator
  def current
    raise NotImplementedError
  end

  def next
    raise NotImplementedError
  end

  def done
    raise NotImplementedError
  end
end

# The LibraryIterator class implements the Iterator interface for the Library
# class. It has a current method that returns the current book in the iteration,
# a next method that advances the iteration to the next book, and a done method
# that returns true if the iteration is complete and false if it is not.
class LibraryIterator < Iterator
  def initialize(library)
    @library = library
    @index = 0
  end

  def current
    @library.books[@index]
  end

  def next
    @index += 1
  end

  def done
    @index >= @library.books.length
  end
end

# The Library class represents a library. It has a books attribute that stores
# the books in the library, and a check_out method that allows a user to check
# out a book.
class Library
  attr_accessor :books

  def initialize
    @books = []
  end

  def check_out(book)
    @books.delete(book)
  end
end

# The client code can use the LibraryIterator to browse and check out books in
# the library.
library = Library.new
library.books = [
  'The Alchemist',
  'The Power of Now',
  'The Four Agreements'
]

iterator = LibraryIterator.new(library)
while !iterator.done
  book = iterator.current
  puts "Checking out book: #{book}"
  library.check_out(book)
  iterator.next
end

# Output:
# Checking out book: The Alchemist
# Checking out book: The Power of Now
# Checking out book: The Four Agreements

# In this example, the Iterator class represents an iterator for a collection, and the LibraryIterator class implements the Iterator interface for
# the Library class. The LibraryIterator class has a current method that returns the current book in the iteration, a next method that advances the
# iteration to the next book, and a done method that returns true if the iteration is complete and false if it is not.
#
# The Library class represents a library, and has a books attribute that stores the books in the library, and a check_out method that allows a user
# to check out a book.
#
# The client code can use the LibraryIterator to browse and check out books in the library by creating a new LibraryIterator object and passing it
# the library object, and then using a while loop to iterate through the books in the library. Inside the loop, the client code can use the current
# method to get the current book in the iteration, and the check_out method to check out the book. The next method is called at the end of the loop
# to advance the iteration to the next book. The loop terminates when the done method returns true.