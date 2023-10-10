require 'json'

class DataMangaer
    attr_accessor :books, :rentals

    def initialize
        @books = []
        @rentals = []
    end
    def load_data
        load_books
    end

    def save_data
        begin
            save_books
            puts "Books Saved!"
        rescue StandardError => e 
            puts "Error Saving Data: #{e.message}"
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
              'type' => rental.person.class.name,
              'age' => rental.person.age,
              'name' => rental.person.name,
              'parent_permission' => rental.person.parent_permission
            }
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
end
