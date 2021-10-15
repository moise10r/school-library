require_relative '../teacher'
describe Teacher do
    before :each do
      @teacher = Teacher.new(age: 50, specialization: 'Neurologist')
    end
    it 'returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
end