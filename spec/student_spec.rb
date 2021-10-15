require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @classroom = Classroom.new('learn to code')
    @student = Student.new(name: 'Moise', age: 21, parent_permission: true, classroom: @classroom)
  end

  it 'returns a Teacher object' do
    expect(@student).to be_an_instance_of Student
  end

  it 'should be identical' do
    expect(@student.classroom).to eq @classroom
  end

  it 'should return ¯\(ツ)/¯' do
    expect(@student.play_hooky).to eq '¯\(ツ)/¯'
  end
end
