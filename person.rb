require 'securerandom'

class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = SecureRandom.hex(13)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    @age >= 18
  end
  
  def can_use_services?
    is_of_age? || @parent_permission
  end

  private :is_of_age?
end
