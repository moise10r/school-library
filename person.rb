require 'securerandom'
require_relative 'corrector'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = SecureRandom.hex(13).to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(rental)
    @rentals << rental
  end

  private :of_age?
end
