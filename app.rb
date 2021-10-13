require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require 'json'

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
    @books = load_books
    load_persons
    load_rentals(@persons, @books)
    # File.foreach('rentals.txt') { |rental| @rentals.push(rental) } if File.exist?('rentals.txt')
  end

  def load_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json'), create_additions: true)
    else
      []
    end
  end

  def load_persons
    if File.exist?('persons.json')
      JSON.parse(File.read('persons.json')).map do |person|
        if person['json_class'] == 'Student'
          load_student(person, 'learn to code')
        else
          load_teacher(person)
        end
      end
    else
      @persons = []
    end
  end

  def load_teacher(person)
    id = person['id'].to_i
    name = person['name']
    age = person['age']
    specialization = person['specialization']

    teacher = Teacher.new(age, specialization, name)
    teacher.id = id
    @persons.push(teacher)
  end

  def load_student(person, classroom)
    id = person['id'].to_i
    name = person['name']
    age = person['age']
    parent_permission = person['parent_permission']

    student = Student.new(age, classroom, name, parent_permission)
    student.id = id
    @persons.push(student)
  end

  def load_rentals(persons, books)
    if File.exist?('rentals.json')
      JSON.parse(File.read('rentals.json')).map do |rental|
        book = books.find { |curr_book| curr_book.title == rental['book'] }
        person = persons.find { |curr_person| curr_person.id == rental['person'].to_i }

        @rentals.push(Rental.new(rental['date'], person, book))
      end
    else
      @rentals = []
    end
  end

  def save_files
    File.write('books.json', JSON.generate(@books)) if @books.any?
    File.write('persons.json', JSON.generate(@persons)) if @persons.any?
    File.write('rentals.json', JSON.generate(@rentals)) if @rentals.any?
  end
end
