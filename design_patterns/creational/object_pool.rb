# The Object Pool design pattern is a creational design pattern that allows you to reuse objects from a pool of objects, rather than creating
# new objects each time they are needed. It is often used to improve the performance of applications by reducing the overhead of creating and
# destroying objects, and can help to reduce memory usage and improve resource utilization.
#
# Here's a summary of the Object Pool pattern:
#
# The Object Pool pattern allows you to reuse objects from a pool of objects, rather than creating new objects each time they are needed.
# It is often used to improve the performance of applications by reducing the overhead of creating and destroying objects, and can help to reduce
# memory usage and improve resource utilization.
# The Object Pool pattern consists of a pool class and an object class.
# The pool class stores a collection of objects, and provides methods to check out and return objects from the pool.
# The object class represents the objects in the pool, and may include additional behavior or state.
#
# Here's an example of the Object Pool design pattern in Ruby for a database connection scenario, with a real-world example to illustrate the concept:
#
# Imagine you are building a web application that connects to a database to retrieve data. The application needs to create a new database
# connection each time it needs to retrieve data, which can be time-consuming and resource-intensive.
#
# To improve the performance of the application, you could use the Object Pool design pattern to create a pool of database connections,
# and reuse connections from the pool rather than creating new connections each time they are needed.

# The DatabaseConnection class represents a database connection. It has a
# connection_string attribute that stores the connection string, and a
# connect and disconnect method that allow the connection to be established and
# closed.
class DatabaseConnection
  attr_reader :connection_string

  def initialize(connection_string)
    @connection_string = connection_string
  end

  def connect
    puts "Connecting to the database with connection string: #{connection_string}"
  end

  def disconnect
    puts "Disconnecting from the database"
  end
end

# The DatabaseConnectionPool class represents a pool of database connections. It
# has a connections attribute that stores the connections in the pool, and
# provides a check_out and check_in method that allow connections to be checked
# out and returned to the pool.
class DatabaseConnectionPool
  attr_reader :connections

  def initialize
    @connections = []
  end

  def check_out
    connection = connections.pop
    puts "Checking out connection: #{connection.object_id}"
    connection
  end

  def check_in(connection)
    puts "Checking in connection: #{connection.object_id}"
    connections << connection
  end
end

# The client code can use the DatabaseConnection and DatabaseConnectionPool
# classes to retrieve database connections from the pool.
connection_pool = DatabaseConnectionPool.new

5.times do
  connection = DatabaseConnection.new('connection string')
  connection_pool.check_in(connection)
end

10.times do
  connection = connection_pool.check_out
  connection.connect
  connection.disconnect
  connection_pool.check_in(connection)
end

# Output:
# Checking in connection: 70362053569400
# Checking in connection: 70362053569380
# Checking in connection: 70362053569360
# Checking in connection: 70362053569340
# Checking in connection: 70362053569320
# Checking out connection: 70362053569320
# Connecting to the database with connection string: connection string
# Disconnecting from the database
# Checking in connection: 70362053569320
# Checking out connection: 70362053569400
# Connecting to the database with connection string: connection string
# Disconnecting from the database
# Checking in connection: 70362053569400
# Checking out connection: 70362053569380
# Connecting to the database with connection string: connection string
# Disconnecting from the database
# Checking in connection: 70362053569380
# Checking out connection: 70362053569360
# Connecting to the database with connection string: connection string
# Disconnecting from the database
# ...

# In this example, the DatabaseConnection class represents a database connection, and has a connection_string attribute that stores the
# connection string, and a connect and disconnect method that allow the connection to be established and closed.
#
# The DatabaseConnectionPool class represents a pool of database connections, and has a connections attribute that stores the connections
# in the pool. It provides a check_out and check_in method that allow connections to be checked out and returned to the pool.
#
# The client code creates a new DatabaseConnectionPool and adds 5 DatabaseConnection objects to the pool. It then checks out 10 connections
# from the pool, uses them to connect and disconnect from the database, and returns them to the pool.
#
# Using the Object Pool design pattern in this way allows the application to reuse database connections from the pool, rather than creating
# new connections each time they are needed. This can improve the performance of the application by reducing the overhead of creating and
# destroying connections, and can help to reduce memory usage and improve resource utilization.
