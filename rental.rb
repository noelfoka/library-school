class Rental
  attr_accessor :date

  belongs_to :book
  belongs_to :person

  def initialize(date)
    @date = date
  end

  def initialize(book, person)
    super()
    self.book = book
    self.person = person
  end
end
