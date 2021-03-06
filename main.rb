require_relative 'app'

def show_options
  options = [
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person ID',
    '7 - Exit'
  ]
  puts
  puts 'Please choose an option by entering a number: '
  puts options
  puts
  gets.chomp.to_i
end

# rubocop:disable Metrics/CyclomaticComplexity
def select_option(library, choice)
  case choice
  when 1
    library.handle_book_list
  when 2
    library.handle_person_list
  when 3
    library.create_person
  when 4
    library.create_book
  when 5
    library.create_rental
  when 6
    library.handle_rentals_list
  when 7
    puts 'Thank you for using this app!'
    library.save_files
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def run
  library = App.new
  library.load_files
  choice = 0
  until choice == 7
    choice = show_options
    choice = show_options while choice < 1 || choice > 7
    puts
    select_option(library, choice)
  end
end

def main
  puts 'Welcome to School Library App!'
  run
end

main
