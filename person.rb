require 'securerandom'

class Person
  attr_accessor :id, :name, :age

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = SecureRandom.hex(13)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def is_of_age?
    @age >= 18
  end

end

person = Person.new(21, "Moise",true)
puts person.name
puts person.can_use_services = true