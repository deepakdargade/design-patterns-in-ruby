require 'observer'

class Employee
  include Observable

  attr_reader :name, :salary

  def initialize(name , salary)
    @name = name
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end

end

e = Employee.new("Deepak", 5000)
e.salary = 4000