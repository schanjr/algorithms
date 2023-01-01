# The Private Class Data design pattern is a creational design pattern that allows objects to have private data that can only be
# accessed through public methods. It is often used to encapsulate data within an object, and to ensure that the data is only accessed
# in a controlled and predictable way.
#
#   Here's a summary of the Private Class Data pattern:
#
# The Private Class Data pattern allows objects to have private data that can only be accessed through public methods.
# It is often used to encapsulate data within an object, and to ensure that the data is only accessed in a controlled and predictable way.
# The Private Class Data pattern consists of a class with private data attributes and public accessor methods.
# The accessor methods are used to get and set the values of the private data attributes.
#
# Here's an example of the Private Class Data design pattern in Ruby for a bank account scenario, with a real-world example to illustrate the concept:
#
# Imagine you are building a bank account application that allows users to open and manage bank accounts. Each bank account has a balance,
# and users can deposit and withdraw money from their accounts.
#
# To implement this feature, you could use the Private Class Data design pattern to encapsulate the balance data within the BankAccount class,
# and provide public methods to allow users to access and modify the balance in a controlled and predictable way.
#
class BankAccount
  def initialize(balance)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def balance
    @balance
  end
end

# The client code can use the BankAccount class to create and manage bank
# accounts.
account = BankAccount.new(100)

puts account.balance
# Output: 100

account.deposit(50)

puts account.balance
# Output: 150

account.withdraw(25)

puts account.balance
# Output: 125
