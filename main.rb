require_relative 'app'

def main
  puts 'Welcome to School Library App!'
  puts
  library = App.new
  library.run
end

main
