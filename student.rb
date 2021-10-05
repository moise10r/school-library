
require_relative 'person'

class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end
  def play_hooky
    "¯\(ツ)/¯"
  end
end
s= Student.new(4)
puts s.parent_permission