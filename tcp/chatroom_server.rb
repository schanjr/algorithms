require 'socket'

class ChatroomServer
  def initialize(port)
    @server = TCPServer.new(port)
    @server.listen(Socket::SOMAXCONN)
    @connections = []
    puts "Listening on port #{port}"
  end

  def start
    Socket.accept_loop(@server) do |connection|
      @connections << connection
      puts @connections
      Thread.new do
        loop do
          handle(connection)
        end
      end
    end
  end


  def handle(connection)
    begin
      message = connection.read_nonblock(4096)
    rescue Errno::EAGAIN
      IO.select([connection])
      retry
    rescue EOFError, IOError # IOError - when client self disconnected #EOFError
      connection.close
      return
    end
    broadcast(connection, message) unless message.nil?
  end

  def broadcast(sender_connection, message)
    @connections.delete_if do |connection|
      if connection.closed?
        true
      else
        connection.puts(message) if connection != sender_connection && !connection.closed?
      end
    end
  end
end

server = ChatroomServer.new(4002)
server.start