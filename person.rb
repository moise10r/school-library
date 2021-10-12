require_relative 'corrector'
# rubocop:disable Style/OptionalBooleanParameter
class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(0..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  private

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

  def to_s
    "ID: #{@id}, Name: #{@name}, Age: #{@age}"
  end
end
# rubocop:enable Style/OptionalBooleanParameter
