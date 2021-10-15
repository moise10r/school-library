require_relative 'corrector'
class Person
  attr_accessor :name, :age, :id
  attr_reader :rentals, :parent_permission

  def initialize(age:, parent_permission: true, name: 'Unknown')
    @id = Random.rand(0..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
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

  private

  def of_age?
    @age >= 18
  end

  def to_s
    "ID: #{@id}, Name: #{@name}, Age: #{@age}"
  end
end
