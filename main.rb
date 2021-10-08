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
  

  def run
    choice = show_options
    choice = show_options while choice < 1 || choice > 7
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
  

  def handle_book_list
    @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    run
  end

  def handle_person_list
    @persons.each do |person|
      puts "[#{person.class.name.split('::').last}] Name: '#{person.name}', ID: #{person.id} , Age: #{person.age}"
    end
    run
  end


  def handle_rentals_list
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    selected_rental = @rentals.select { |rental| rental.person.id == id }
    selected_rental.each { |s_rental| puts "Date: '#{s_rental.date}', Book: #{s_rental.book.title} , by: #{s_rental.book.author}" }
    run
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @persons.push(Teacher.new(age, name, specialization))
  end

end