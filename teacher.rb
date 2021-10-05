
require_relative 'person'

class Teacher < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student =  Teacher.new("Moise");
puts student.name =" Moise"