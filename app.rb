class App 
  attr_accessor :books, :people, :rentals
  
  def initialize(books, people, rentals)
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
        puts "#{book.title} by #{book.author}"
    end
  end
end