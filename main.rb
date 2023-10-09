require_relative 'app'
require_relative 'option_handler'
require_relative 'options'

def prompt
  puts 'Welcome to the School Library App!'
  app = App.new
  option_handler = OptionHandler.new(app)
  options = ShowOptions.new

  loop do
    options.show_options
    option = gets.chomp.to_i
    break if option == 7

    option_handler.call_option(option)
  end
end

prompt
