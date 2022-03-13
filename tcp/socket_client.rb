require 'socket'

# 1. create
# 2. bind
# 3. connect
# 4. close


socket = Socket.new(:INET, :STREAM)
# Initiate a connection to google.com on port 80.
remote_addr = Socket.pack_sockaddr_in(4002, '0.0.0.0')
socket.connect(remote_addr)
socket.close
