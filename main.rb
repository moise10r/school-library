require_relative 'student'
require_relative 'teacher'
require_relative 'book'
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

    case choice
    when 1
      handle_book_list
    when 2
      handle_person_list
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      handle_rentals_list
    when 7
      puts 'Thank you for using this app!'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

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
    selected_rental.each do |s_rental|
      puts "Date: '#{s_rental.date}', Book: #{s_rental.book.title} , by: #{s_rental.book.author}"
    end
    run
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @persons.push(Teacher.new(age: age, specialization: specialization, name: name))
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp != 'n'
    puts 'create'
    @persons.push(Student.new(age: age, classroom: 'learn to code', name: name, parent_permission: parent_permission))
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = 0

    person_type = gets.chomp while person_type != '2' && person_type != '1'

    case person_type
    when '1'
      create_student

    when '2'
      create_teacher
    end
    puts 'Person created successfully'
    puts
    run
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title: title, author: author))
    puts 'Book created successfully'
    puts
    run
  end

  def create_rental
    puts 'Select a book from the following list by number'

    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name.split('::').last}] Name: '#{person.name}', ID: #{person.id} , Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    person = @persons[selected_person]

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date: date, person: person, book: book))
    puts 'Rental created successfully'
    puts
    run
  end
end

def main
  puts 'Welcome to School Library App!'
  puts
  library = App.new
  library.run
end

main
