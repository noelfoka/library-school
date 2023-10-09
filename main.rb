require_relative 'app'
require_relative 'option_handler'

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
  option_handler = OptionHandler.new

  loop do
    show_options
    option = gets.chomp.to_i
    break if option == 7

    option_handler.call_option(option)
  end
end

main
