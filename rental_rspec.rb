require 'rspec'
require_relative 'rental'
require_relative 'person'
require_relative 'book'

describe Rental do
  let(:book) { Book.new('The Formula', 'Author Name') }
  let(:person) { Person.new('Okari', 25) }
  let(:rental) { Rental.new('2004-05-20', book, person) }

  context 'rental is initialized with data' do
    it 'should initialize a date' do
      expect(rental.date).to eq('2004-05-20')
    end

    it 'should initialize a book' do
      expect(rental.book).to be_an_instance_of(Book)
    end

    it 'should initialize a person' do
      expect(rental.person).to be_an_instance_of(Person)
    end
  end

  context 'attr accessors' do
    it 'date is changeable' do
      rental.date = '2009-08-17'
      expect(rental.date).to eq('2009-08-17')
    end

    it 'book is changeable' do
      new_book = Book.new('New Book', 'New Author')
      rental.book = new_book
      expect(rental.book).to eq(new_book)
    end

    it 'person is changeable' do
      new_person = Person.new('Nyandika', 20)
      rental.person = new_person
      expect(rental.person).to eq(new_person)
    end
  end
end
