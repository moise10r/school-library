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
end