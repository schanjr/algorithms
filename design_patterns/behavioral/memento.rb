# The Memento design pattern is a behavioral design pattern that allows you to save and restore the state of an object without violating its
# encapsulation. It is often used to implement undo and redo functionality in applications.
#
#   Here's a summary of the Memento pattern:
#
# The Memento pattern allows you to save and restore the state of an object without violating its encapsulation.
# It is often used to implement undo and redo functionality in applications.
# The Memento pattern consists of three types of objects: the originator, the memento, and the caretaker.
# The originator is the object whose state needs to be saved and restored. It creates a memento object that contains a snapshot of its current state, and provides methods to set and get the state from the memento.
# The memento is an object that stores the state of the originator. It is an immutable object that stores the state of the originator in a manner that the originator can restore its previous state, but cannot modify the memento.
# The caretaker is an object that is responsible for managing the mementos. It stores the mementos and provides methods to create and retrieve them.

# Imagine you are using a text editor to write a report for work. As you work on the report, you make changes to the text and save them. However,
# you later realize that you made a mistake and want to go back to a previous version of the report.
#
# To do this, you could use the Memento design pattern to save the text of the report at different points in time, and then restore the text to
# a previous version if needed.
#

# The TextEditor class represents a text editor. It has a text attribute that
# stores the current text, and a save and restore method that allow the text
# to be saved and restored.
class TextEditor
  attr_accessor :text

  def initialize
    @text = ''
  end

  def save
    TextEditorMemento.new(@text)
  end

  def restore(memento)
    @text = memento.text
  end
end

# The TextEditorMemento class represents a memento for the TextEditor class. It
# has a text attribute that stores the text.
class TextEditorMemento
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

# The client code can use the TextEditor and TextEditorMemento classes to save
# and restore the text in the text editor.
text_editor = TextEditor.new
text_editor.text = 'Hello, world!'

memento = text_editor.save

text_editor.text = 'Goodbye, world!'

text_editor.restore(memento)
puts text_editor.text

# Output:
# Hello, world!

# In this example, the TextEditor class represents a text editor, and has a text attribute that stores the current text, and a save method that
# creates and returns a new TextEditorMemento object with the current text, and a restore method that restores the text from a given
# TextEditorMemento object.
#
# The TextEditorMemento class represents a memento for the TextEditor class, and has a text attribute that stores the text.
#
# The client code can use the TextEditor and TextEditorMemento classes to save and restore the text in the text editor by creating a new
# TextEditor object and setting its text attribute to a string, creating a memento using the save method, changing the text attribute, and then
# restoring the text using the restore method with the memento.

# In this example, the Memento design pattern allows us to create a snapshot of the text editor's state, and restore the text editor to a previous
# state by using the memento. This can be useful when we want to allow the user to undo and redo actions in the text editor, or to provide a way to
# roll back to a previous state if an error occurs.