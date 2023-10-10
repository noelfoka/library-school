require 'json'

class DataManager
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
  end

  def load_data
    load_books
    load_people
  end

  def save_data
    save_books
    save_people
    puts 'Books Saved!'
  rescue StandardError => e
    puts "Error Saving Data: #{e.message}"
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
      file.puts @people.map do |person|
        {
          'type' => person.class.name,
          'age' => person.age,
          'name' => person.name,
          'parent_permision' => person.parent_permission
        }
      end.to_json
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
        Student.new(person_data['name'], person_data['age'], person_data['parent_permission'])
      elsif person_data['type'] == 'Teacher'
        Teacher.new(person_data['specialization'], person_data['age'], person_data['name'])
      else
        raise "Invalid person type: #{person_data['type']}"
      end
    end
  end
end
