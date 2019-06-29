module Subject
  def initialize
    @observers = []
  end

  def add_observer(&observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.call(self)
    end
  end
end

class Employee
  include Subject

  attr_reader :name
  attr_reader :salary

  def initialize(name, salary)
    super()
    @name = name
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

deepak = Employee.new('Deepak', '5000')

deepak.add_observer do |changed_employee|
  puts "Cut a new for #{changed_employee.name}"
  puts "His salary is #{changed_employee.salary}"
end

deepak.salary = 10000