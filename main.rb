require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'


class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end
  
  def show_options
    options = [
      '1 - list all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - exit'
    ]
    puts
    puts 'Please choose an option by entering a number: '
    puts options
    gets.chomp.to_i
  end
  
end