# The Composite design pattern is a structural design pattern that allows you to compose objects into tree structures,
# and treat individual objects and compositions of objects uniformly. The Composite design pattern is often used to
# represent part-whole hierarchies, and to allow clients to treat individual objects and compositions of objects uniformly.
#
# Imagine that you are building a system for a company that has a hierarchy of employees, with managers and workers at
# different levels. The company has a set of policies for setting the salaries of employees, and you want to be able
# to apply the policies to individual employees and groups of employees uniformly.
#
#   To implement this scenario using the Composite design pattern, you could define an Employee class that represents an
# employee, and an EmployeeGroup class that represents a group of employees. The Employee class has a salary attribute, and the EmployeeGroup class has a salaries method that returns the sum of the salaries of its employees.
#
#   You could also define a SalaryPolicy class that has a apply method that takes an Employee or EmployeeGroup object
# and applies the policy to it. The SalaryPolicy class would have a reference to an Employee or EmployeeGroup object,
# and its apply method would call the salaries method on the EmployeeGroup object or return the salary attribute of the Employee object.


# The Employee class represents an employee. It has a salary attribute.
class Employee
  attr_reader :salary

  def initialize(salary)
    @salary = salary
  end
end

# The EmployeeGroup class represents a group of employees. It has a
# salaries method that returns the sum of the salaries of its employees.
class EmployeeGroup
  def initialize
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def salaries
    @employees.map(&:salary).inject(:+)
  end
end

# The SalaryPolicy class has an apply method that takes an Employee or
# EmployeeGroup object and applies the policy to it. It has a reference to
# an Employee or EmployeeGroup object, and its apply method calls the
# salaries method on the EmployeeGroup object or returns the salary
# attribute of the Employee object.
class SalaryPolicy
  def initialize(employee)
    @employee = employee
  end

  def apply
    if @employee.is_a?(Employee)
      @employee.salary *= 1.1
    elsif @employee.is_a?(EmployeeGroup)
      @employee.salaries *= 1.1
    end
  end
end

# The client code can work with any object that implements the Employee or
# EmployeeGroup interface, allowing it to apply policies to individual
# employees and groups of employees uniformly.
manager = Employee.new(100_000)
team = EmployeeGroup.new
team.add_employee(Employee.new(70_000))
team.add_employee(Employee.new(50_000))

SalaryPolicy.new(manager).apply
SalaryPolicy.new(team).apply

puts manager.salary
puts team.salaries

# In this example, the Employee class represents an employee, and the EmployeeGroup class represents a group of employees.
# The Employee class has a salary attribute, and the EmployeeGroup class has a salaries method that returns the sum of the
# salaries of its employees.
#
#   The SalaryPolicy class has an apply method that takes an Employee or EmployeeGroup object and applies the policy to it.
# The SalaryPolicy class has a reference to an Employee or EmployeeGroup object, and its apply method calls the salaries method
# on the EmployeeGroup object or returns the salary attribute of the Employee object.
#
#     This allows the client code to work with any object that implements the Employee or EmployeeGroup interface,
# allowing it to apply policies to individual employees and groups of employees uniformly.
#
#     This example demonstrates how the Composite design pattern allows you to compose objects into tree structures,
# and treat individual objects and compositions of objects uniformly, and how it can be used to represent part-whole
# hierarchies and allow clients to treat individual objects and compositions of objects uniformly.