require_relative '../person'


describe Person do
  describe '#new' do
    person = Person.new(name: 'Moise', age: 17, parent_permission: false)
      it 'takes 3 parameters and returns a Person object' do
        expect(person).to be_an_instance_of Person
      end

      it 'should set the correct name' do
        expect(person.name).to eq 'Moise'
      end

      it 'should have parent_permission set to false' do
        expect(person.parent_permission).to be(false)
      end
  end
  describe '#can_use_services' do
      it 'should be registered only if the parent permission' do
        person = Person.new(name: 'Moise', age: 21, parent_permission: true)
        expect(person.can_use_services?).to be(true)
      end

      it 'should be allowed without parent permission' do
        person = Person.new(name: 'Rush', age: 17, parent_permission: false)
        expect(person.can_use_services?).to be(false)
      end
  end
end