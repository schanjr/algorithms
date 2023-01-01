# Imagine that a customer service center has a chain of employees that handle customer complaints.
# The chain starts with front-line customer service representatives, who handle simple complaints and issues.
# If a customer service representative is unable to resolve a complaint or issue, they can escalate it to a team leader.
# If the team leader is unable to resolve the complaint or issue, they can escalate it to a manager.
# If the manager is unable to resolve the complaint or issue, they can escalate it to a director.
#
#To implement this scenario using the Chain of Responsibility design pattern, the customer service center could define a
# ComplaintHandler class that represents a handler in the chain, and concrete implementations of the ComplaintHandler class
# for each level in the chain (e.g. CustomerServiceRepresentative, TeamLeader, Manager, Director).
# Each handler would have the ability to handle complaints and issues that they are responsible for,
# and to escalate complaints and issues to their successor if they are unable to handle them.
#
# The customer service center could then create a chain of ComplaintHandler objects, starting with a front-line
# customer service representative and ending with a director. When a customer submits a complaint or issue,
# it would be passed down the chain of handlers until it is handled by one of the handlers or reach the end of the chain
# if it is not handled.
# The base ComplaintHandler class declares an interface for handling complaints
# and includes a set of default behavior for forwarding complaints to its
# successor.
class ComplaintHandler
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def handle_complaint(complaint)
    if successor
      successor.handle_complaint(complaint)
    else
      puts 'End of chain reached. Complaint not handled.'
    end
  end
end

# Concrete ComplaintHandlers handle complaints they are responsible for.
class CustomerServiceRepresentative < ComplaintHandler
  def handle_complaint(complaint)
    if complaint == 'simple'
      puts 'Customer service representative can handle this complaint'
    else
      super(complaint)
    end
  end
end

class TeamLeader < ComplaintHandler
  def handle_complaint(complaint)
    if complaint == 'intermediate'
      puts 'Team leader can handle this complaint'
    else
      super(complaint)
    end
  end
end

class Manager < ComplaintHandler
  def handle_complaint(complaint)
    if complaint == 'complex'
      puts 'Manager can handle this complaint'
    else
      super(complaint)
    end
  end
end

class Director < ComplaintHandler
  def handle_complaint(complaint)
    if complaint == 'critical'
      puts 'Director can handle this complaint'
    else
      super(complaint)
    end
  end
end

# The customer service center creates a chain of complaint handlers, starting
# with a front-line customer service representative and ending with a director.
csr = CustomerServiceRepresentative.new
tl = TeamLeader.new(csr)
manager = Manager.new(tl)
director = Director.new(manager)

# When a customer submits a complaint, it is passed down the chain of handlers
# until it is handled by one of the handlers or reach the end of the chain if
# it is not handled.
director.handle_complaint('simple')
director.handle_complaint('intermediate')
director.handle_complaint('complex')
director.handle_complaint('critical')
director.handle_complaint('unhandled')


# In this example, the ComplaintHandler class declares an interface for handling complaints and includes default behavior for forwarding complaints to its successor. The CustomerServiceRepresentative, TeamLeader, Manager, and Director classes are concrete implementations of the ComplaintHandler class that handle complaints they are responsible for.
#
#   The customer service center creates a chain of ComplaintHandler objects, starting with a front-line customer service representative and ending with a director. When a customer submits a complaint, it is passed down the chain of handlers until it is handled by one of the handlers or reach the end of the chain if it is not handled.
