require 'json'

class DataManager
  attr_accessor :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  def save_data
    save_books
    save_people
    save_rentals
    puts 'Books Saved!'
  rescue StandardError => e
    puts "Error Saving Data: #{e.message}"
  end

  def save_rentals
    File.open('rentals.json', 'w') do |file|
      file.puts @rentals.map { |rental|
        {
          'date' => rental.date,
          'book' => {
            'title' => rental.book.title,
            'author' => rental.book.author
          },
          'person' => {
            'id' => rental.person.id,
            'type' => rental.person.class.name,
            'age' => rental.person.age,
            'name' => rental.person.name,
            'parent_permission' => rental.person.parent_permission
          }
        }
      }.to_json
    end
  end

  def save_books
    File.open('books.json', 'w') do |file|
      file.puts @books.map { |book|
                  {
                    'title' => book.title,
                    'author' => book.author
                  }
                }.to_json
    end
  end

  def save_people
    File.open('people.json', 'w') do |file|
      file.puts @people.map { |person|
                 {
                    'type' => person.class.name,
                    'age' => person.age,
                    'name' => person.name,
                    'parent_permision' => person.parent_permission,
                    'specialization' => person.specialization
                  }
                }.to_json
    end
  end

  private

  def load_books
    return unless File.exist?('books.json')

    json_str = File.read('books.json')
    @books = JSON.parse(json_str).map do |book_data|
      Book.new(book_data['title'], book_data['author'])
    end
  end

  def load_people
    return unless File.exist?('people.json')

    json_str = File.read('people.json')
    @people = JSON.parse(json_str).map do |person_data|
      if person_data['type'] == 'Student'
        Student.new(person_data['age'], person_data['name'], person_data['parent_permission'])
      elsif person_data['type'] == 'Teacher'
        Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
      else
        raise "Invalid person type: #{person_data['type']}"
      end
    end
  end

  def load_rentals
    return unless File.exist?('rentals.json')

    json_str = File.read('rentals.json')
    data = JSON.parse(json_str)
    @rentals = data.map do |rental_data|
      book = Book.new(rental_data['book']['title'], rental_data['book']['author'])
      person = case rental_data['person']['type']
               when 'Student'
                 Student.new(rental_data['person']['age'].to_i, rental_data['person']['name'],
                             parent_permission: rental_data['person']['parent_permission'])
               when 'Teacher'
                 Teacher.new(rental_data['person']['age'].to_i, rental_data['person']['specialization'], 
                             rental_data['person']['name'])
               end
      Rental.new(rental_data['date'], book, person)
    end
    @rentals
  end
end
