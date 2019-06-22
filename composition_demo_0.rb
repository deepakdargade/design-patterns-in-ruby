class Movement
  def walk
    puts "I am walking"
  end

  def crawl
    puts "I am crawling"
  end
end

class Man
  def initialize
    @movement = Movement.new
  end

  def move
    @movement.walk
  end
end


class Dog
  def initialize
    @movement = Movement.new
  end

  def move
    @movement.crawl
  end
end

man = Man.new
man.move

dog = Dog.new
dog.move