class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    super()
    @date = date

    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end
