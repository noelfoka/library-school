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
    end
    @people << person
    puts '#{person.name} (#{person.type}) created'
  end
end