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

  describe '#title' do
    it 'returns the title' do
      expect(@book.title).to eq 'Game of thrones'
    end
  end

  describe '#author' do
    it 'returns the author' do
      expect(@book.author).to eq 'Moise'
    end
  end
end
