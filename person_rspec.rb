require 'rspec'
require 'date'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

describe Person do
  let(:person) { Person.new(18, 'Noel') }

  context '#add_rentals' do
    it 'adds a new rental to the rental list of a person' do
      person = Person.new(25)
      book = Book.new('Book 1', 'Author 1')
      date = Date.today

      person.add_rentals(book, date)

      expect(person.rentals).to include(Rental.new(date, book, person))
    end
  end

  context '#using_services' do
    it 'returns true if the person is of age' do
      person = Person.new(14)
      expect(person.can_use_services?).to be true
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(16, parent_permission: true)
      expect(person.can_use_services?).to be true
    end

    it 'returns false if the person is not of age and does not have parent permission' do
      person = Person.new(16, parent_permission: false)
      expect(person.can_use_services?).to be false
    end
  end

  context '#correct_name' do
    it 'returns the actual name' do
      person = Person.new(14, 'Okari')
      expect(person.correct_name).to eq 'Okari'
    end

    context '#private methods' do
      context '#of_age?' do
        it 'returns true if the person is 18 years old or older' do
          expect(person.send(:of_age?)).to be true
        end

        it 'returns false if the person is younger than 18 years old' do
          person.age = 17
          expect(person.send(:of_age?)).to be false
        end
      end
    end
  end
end
