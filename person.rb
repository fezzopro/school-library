class Person
  attr_reader :id, :name, :age
  attr_writer :name, :age
  def initialize(name, age, parent_permission = true)
    @id = rand(1_000_000)
    @name = name || 'Unknown'
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private :of_age?
end