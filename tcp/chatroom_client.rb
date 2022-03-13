require 'socket'

class ChatroomClient
  class << self
    attr_accessor :host, :port
  end

  def self.pid
    @pid ||= Process.pid
  end

  def self.request
    @client = TCPSocket.new(host, port)
    listen
    send
  end

  def self.listen
    Thread.new do
      loop do
        puts "#{@client.gets}"
      end
    end
  end

  def self.send
    Thread.new do
      loop do
        msg = $stdin.gets.chomp
        @client.puts("PID #{pid} says: #{msg}")
      end
    end.join
  end
end


ChatroomClient.host = '127.0.0.1'
ChatroomClient.port = 4002
ChatroomClient.request