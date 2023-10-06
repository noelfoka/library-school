require_relative 'app'

def show_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def prompt
  puts 'Welcome to the School Library App!'
  loop do
    show_options
    option = gets.chomp.to_i
    break if option == 7

    call_option(option)
  end
end

def call_option(option)
  case option
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals
  end
end

def main
  app = App.new
  app.run
end

main
