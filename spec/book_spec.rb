require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Game of thrones', 'Moise')
  end

describe '#new' do
  it 'returns a Book object' do
    expect(@book).to be_an_instance_of Book
  end
end

