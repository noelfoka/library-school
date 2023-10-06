class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "#{person.name} #{person.type}"
    end
  end

  def create_person(name, type)
    if type == 'teacher'
      person = Teacher.new(name)
    elsif type == 'student'
      person = Student.new(name)
    else
      puts 'Invalid person type'
      return
    end
    @people << person
    puts "#{person.name} (#{person.type}) created"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} by #{book.author}"
  end

  def create_rentals(person_id, book_title)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.title == book_title }
    if peson.nil
      puts 'person not found'
      return
    elsif book.nil
      puts 'Book not found'
      return
    end
    rental = Rental.new(person, book)
    @rentals << rental
    puts 'Rental created'
  end

  def list_rentals(person_id)
    rentals = @rentals.select { |r| r.person.id == person_id }
    if rentals.empty?
      puts "No rentals found for person with id #{person_id}"
      return
    end
    rentals.each do |rental|
      puts "#{rental.book.title} rented on #{rental.date}"
    end
  end
end
