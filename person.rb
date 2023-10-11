require_relative 'nameable'

class Person < Nameable
  attr_reader :id, :specialization
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..10)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rentals(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
