require_relative '../rental'
require_relative '../person'
require_relative '../book'
describe Rental do
  describe '#new' do
    book = Book.new('Legend', 'Rush')
    person = Person.new(name: 'Moise', age: 17, parent_permission: false)
    rental = Rental.new('2021/10/13', person, book)
    it 'returns a Rental object' do
      expect(rental).to be_an_instance_of Rental
    end
    it 'should set the correct book' do
      expect(rental.book).to eq book
    end
    it 'should set the correct person' do
      expect(rental.person).to eq person
    end
    it 'should set the correct date' do
      expect(rental.date).to eq '2021/10/13'
    end
    it 'should contain a new rental in person' do
      expect(person.rentals).to include(rental)
    end
    it 'should contain a new rental in book' do
      expect(book.rentals).to include(rental)
    end
  end
end
