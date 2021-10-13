require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def handle_book_list
    @books.each { |book| puts book }
  end

  def handle_person_list
    @persons.each { |person| puts person }
  end

  def handle_rentals_list
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    selected_rental = @rentals.select { |rental| rental.person.id == id }

    selected_rental.each { |s_rental| puts s_rental }
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @persons.push(Teacher.new(age, specialization, name))
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp != 'n'

    @persons.push(Student.new(age, 'learn to code', name, parent_permission))
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
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book}" }
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

    puts 'Select a person from the following list by number'
    @persons.each_with_index do |person, index|
      splited_name = person.class.name.split('::').last
      puts "#{index}) [#{splited_name}] #{person}"
    end
    selected_person = gets.chomp.to_i
    person = @persons[selected_person]

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, person, book))
    puts 'Rental created successfully'
  end

  def load_files
    File.foreach('books.txt') { |book| @books.push(book) } if File.exist?('books.txt')
    File.foreach('persons.txt') { |person| @persons.push(person) } if File.exist?('persons.txt')
    File.foreach('rentals.txt') { |rental| @rental.push(rental) } if File.exist?('rentals.txt')
  end

  def save_files
    File.write('books.txt', @books.join("\n")) if @books.any?
    File.write('people.txt', @persons.join("\n")) if @persons.any?
    File.write('rentals.txt', @rentals.join("\n")) if @rentals.any?
  end
end
