require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1_000_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private :of_age?
end
