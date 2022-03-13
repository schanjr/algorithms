require 'socket'

# Server life cycle
# 1. create
# 2. bind
# 3. listen
# 4. accept
# 5. close
#
# Create a TCP socket
socket = Socket.new(:INET, :STREAM)
# Create a C struct to hold the address for listening.
addr = Socket.pack_sockaddr_in(3000, '0.0.0.0')
# Bind to it.
socket.bind(addr)
socket.listen(Socket::SOMAXCONN)

loop do
  connection, addr_info = socket.accept # socket.accept is blocking. If there are more connections in the queue, it should pop it off individually.
  puts "Connection class: #{connection.class}"
  puts "Connection Fil no: #{connection.fileno}" # Sockets are file, in Unix, everything is file
  puts "Server Filno: #{socket.fileno}"
  puts "Local Address: #{connection.local_address}"
  puts "Remote address: #{connection.remote_address}"
  connection.close
end

########## Alternatively:
# Create the listener socket.

# servers = Socket.tcp_server_sockets(3000)
# # Enter an endless loop of accepting and
# # handling connections.
# Socket.accept_loop(servers) do |connection|
#   # handle connection
#   connection.close
# end
