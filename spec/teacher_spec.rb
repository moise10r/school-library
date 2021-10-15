require_relative '../teacher'
describe Teacher do
    before :each do
      @teacher = Teacher.new(age: 50, specialization: 'Neurologist')
    end
end