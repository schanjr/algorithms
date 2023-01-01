# The Bridge design pattern is a structural design pattern that decouples an abstraction from its implementation,
# allowing the two to vary independently. The Bridge design pattern is often used to implement the Adapter design pattern,
# which allows you to adapt one interface to another.
#
#   Here's a real-world example of how the Bridge design pattern could be used, along with an explanation of how
# it could be implemented in Ruby code:
#
# Imagine that you are building a system for a music player that can play different types of audio files
# (e.g. MP3, WAV, and AIFF). The music player has a set of controls for playing, pausing, and stopping the audio,
# and you want to be able to add support for new audio file types without changing the existing controls.
#
# To implement this scenario using the Bridge design pattern, you could define an AudioPlayer class that represents
# the music player and has a play, pause, and stop method for controlling the audio. You could also define an AudioFile
# interface that declares an play method, and concrete implementations of the AudioFile interface for each type of
# audio file (e.g. MP3AudioFile, WAVAudioFile, and AIFFAudioFile).
#
# The AudioPlayer class would have a reference to an AudioFile object, and its play, pause, and stop methods would
# delegate to the corresponding method on the AudioFile object. This allows you to add support for new audio file
# types by creating a new concrete implementation of the AudioFile interface, without changing the existing controls
# in the AudioPlayer class.

# The AudioFile interface declares the play method.
class AudioFile
  def play
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end
end

# Concrete implementations of the AudioFile interface play a specific audio
# file format.
class MP3AudioFile < AudioFile
  def initialize(file_path)
    @file_path = file_path
  end

  def play
    puts "Playing MP3 file: #{@file_path}"
  end
end

class WAVAudioFile < AudioFile
  def initialize(file_path)
    @file_path = file_path
  end

  def play
    puts "Playing WAV file: #{@file_path}"
  end
end

class AIFFAudioFile < AudioFile
  def initialize(file_path)
    @file_path = file_path
  end

  def play
    puts "Playing AIFF file: #{@file_path}"
  end
end

# The AudioPlayer class has a reference to an AudioFile object and delegates
# the play, pause, and stop methods to the AudioFile object.
class AudioPlayer
  def initialize(audio_file)
    @audio_file = audio_file
  end

  def play
    @audio_file.play
  end

  def pause
    puts 'Pausing audio'
  end

  def stop
    puts 'Stopping audio'
  end
end

# The client code can work with the AudioPlayer and any concrete
# implementation of the AudioFile interface.
mp3_file = MP3AudioFile.new('song.mp3')
audio_player = AudioPlayer.new(mp3_file)
audio_player.play
audio_player.pause
audio_player.stop

wav_file = WAVAudioFile.new('song.wav')
audio_player = AudioPlayer.new(wav_file)
audio_player.play
audio_player.pause
audio_player.stop

aiff_file = AIFFAudioFile.new('song.aiff')
audio_player = AudioPlayer.new(aiff_file)
audio_player.play
audio_player.pause

# In this example, the AudioFile interface declares the play method, and the MP3AudioFile, WAVAudioFile, and
# AIFFAudioFile classes are concrete implementations of the AudioFile interface that play a specific audio file format.
#
#   The AudioPlayer class has a reference to an AudioFile object and delegates the play, pause, and stop
# methods to the AudioFile object. This allows you to add support for new audio file types by creating a
# new concrete implementation of the AudioFile interface, without changing the existing controls in the AudioPlayer class.
#
#     The client code can work with the AudioPlayer and any concrete implementation of the AudioFile interface,
# allowing it to play different types of audio files without having to know the details of how each type of audio file is played.
#
#     This example demonstrates how the Bridge design pattern can decouple an abstraction from its
# implementation, allowing the two to vary independently and allowing you to implement the Adapter
# design pattern, which allows you to adapt one interface to another.
#


