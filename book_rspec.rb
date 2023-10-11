require 'rspec'
require 'date'

require_relative 'book'
require_relative 'rental'
require_relative 'person'

describe Book do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new('Mahdi', 25) }
  let(:date) {Date.new(2023, 10, 11)}

  context 'Initialization' do
    it 'should initialize with a title' do
      expect(book.title).to eq('Title')
    end

    it 'should initialize with an author' do
      expect(book.author).to eq('Author')
    end

    it 'should initialize with an empty rentals array' do
      expect(book.rentals).to be_empty
    end
  end

  context 'Attribute Accessors' do
    it 'should allow updating the title' do
      book.title = 'New Title'
      expect(book.title).to eq('New Title')
    end

    it 'should allow updating the author' do
      book.author = 'New Author'
      expect(book.author).to eq('New Author')
    end
  end

  context 'add_rental method' do
    it 'should add a rental to the rentals array' do
      rental = book.add_rental(person, date)
      expect(book.rentals).to include(rental)
    end

    it 'should create a new Rental object' do
      rental = book.add_rental(person, date)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.book).to eq(Book)
      expect(rental.person).to eq(Person)
    end
  end
end
