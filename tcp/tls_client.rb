require 'socket'
require 'openssl'

myXML = 'my_sample_data'
host = 'my_host.com'
port = 30000

socket = TCPSocket.open(host,port)
ssl_context = OpenSSL::SSL::SSLContext.new()
ssl_context.cert = OpenSSL::X509::Certificate.new(File.open("certificate.crt"))
ssl_context.key = OpenSSL::PKey::RSA.new(File.open("certificate.key"))
ssl_context.ssl_version = :SSLv23
ssl_socket = OpenSSL::SSL::SSLSocket.new(socket, ssl_context)
ssl_socket.sync_close = true
ssl_socket.connect

ssl_socket.puts(myXML)
while line = ssl_socket.gets
  p line
end
ssl_socket.close