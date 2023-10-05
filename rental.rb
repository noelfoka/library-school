class Rental
  attr_accessor :date

  belongs_to :book
  belongs_to :person

  def initialize(date, book, person)
    @date = date
    super()
    self.book = book
    self.person = person
  end
end
