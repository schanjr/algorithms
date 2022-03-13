# or use this https://gist.github.com/tedmiston/5935757

require 'socket'

server = TCPServer.new('0.0.0.0', 3000)

response = <<-HEREDOC
HTTP/1.1 200 OK
Content-Type: application/json

{"message":"Hello world from http_server.rb"}
HEREDOC

server.listen(Socket::SOMAXCONN)
loop do
  socket = server.accept
  verb, path, _http_version = socket.gets&.split(' ') || nil
  next if verb.nil?
  puts "Received verb: #{verb} path: #{path} http_version: #{_http_version}"
  while (request = socket.gets) && (request.chomp.length > 0)
    puts "Incoming request headers -- \"#{request.chomp}\"" # the server logs each response
  end
  socket.write(response)
  socket.close
end

