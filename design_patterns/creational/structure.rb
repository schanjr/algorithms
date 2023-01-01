# The Structure design pattern is a creational design pattern that allows you to compose objects into tree structures
# to represent part-whole hierarchies. The Structure design pattern is commonly used to implement the Composite design pattern,
# which allows you to treat individual objects and compositions of objects uniformly.
#
#   Here's a real-world example of how the Structure design pattern could be used, along with an explanation of
# how it could be implemented in Ruby code:
#
# Imagine that you are building a system for a company's organizational chart. The organizational chart has a hierarchy of
# employees, with each employee having a manager and a team of direct reports. An employee can either be a manager or a
# regular employee.
#
#   To implement this scenario using the Structure design pattern, you could define an Employee class that represents an
# employee in the organizational chart. The Employee class would have a name and a list of direct reports
# (if the employee is a manager), and would have methods for adding and removing direct reports, as well as for printing
# the employee's information (including the names of their direct reports).

# The Employee class represents an employee in the organizational chart. It
# has a name and a list of direct reports (if the employee is a manager). It
# has methods for adding and removing direct reports, and for printing the
# employee's information (including the names of their direct reports).
class Employee
  attr_reader :name, :direct_reports

  def initialize(name)
    @name = name
    @direct_reports = []
  end

  def add_direct_report(employee)
    @direct_reports << employee
  end

  def remove_direct_report(employee)
    @direct_reports.delete(employee)
  end

  def print_information
    puts "Employee: #{@name}"
    puts "Direct reports: #{@direct_reports.map(&:name).join(', ')}"
  end
end

# The client code creates employees and builds the organizational chart.
ceo = Employee.new('CEO')
cto = Employee.new('CTO')
cfo = Employee.new('CFO')
vp_engineering = Employee.new('VP of Engineering')
vp_marketing = Employee.new('VP of Marketing')
vp_sales = Employee.new('VP of Sales')

ceo.add_direct_report(cto)
ceo.add_direct_report(cfo)
cto.add_direct_report(vp_engineering)
vp_engineering.add_direct_report(Employee.new('Software Engineer'))
vp_engineering.add_direct_report(Employee.new('Software Engineer'))
vp_engineering.add_direct_report(Employee.new('Software Engineer'))
cto.add_direct_report(vp_marketing)
vp_marketing.add_direct_report(Employee.new('Marketing Manager'))
vp_marketing.add_direct_report(Employee.new('Marketing Manager'))
cfo.add_direct_report(vp_sales)
vp_sales.add_direct_report(Employee.new('Sales Representative'))
vp_sales.add_direct_report(Employee.new('Sales Representative'))
vp_sales.add_direct_report(Employee.new('Sales Representative'))

# The client code can work with the entire organizational chart or with
# individual employees.
ceo.print_information
vp_engineering.print_information
vp_sales.print_information

# In this example, the Employee class represents an employee in the organizational chart and has a name and a
# list of direct reports (if the employee is a manager). It has methods for adding and removing direct reports,
# as well as for printing the employee's information (including the names of their direct reports).
#
# The client code creates Employee objects and builds the organizational chart by adding direct reports to managers.
# The client code can then work with the entire organizational chart or with individual employees by calling the
# print_information method on the Employee objects.
#
# This example demonstrates how the Structure design pattern can be used to represent part-whole hierarchies
# and implement the Composite design pattern, allowing you to treat individual objects and compositions of objects uniformly.
