require 'rspec'
require_relative '../solver'

describe Solver do 
    describe '#factorial' do 
        it 'Returns the factorial of 5' do
            expect(factorial(5)).to eq(120)
        end
        it 'Returns the factorial of 0' do 
            expect(factorial(0)).to eq(1)
        end
        it 'returns the factorial of 1' do 
            expect(factorial(1)).to eq(1)
        end
        it 'returns the factorial of 10' do
            expect(factorial(10)).to eq(3628800)
        end
        it 'riases an error when a negative number is passed' do 
            expect {factorial(-1)}. to raise_error(ArgumentError, 'Argument must be a non-negative integer')
        end
    end

    describe '#reverse' do
        it 'returns the reverse of "hello"' do
            expect(reverse('hello')).to eq('olleh')
        end
        it 'returns the reverse of "world"' do 
            expect(reverse('world')).to eq('dlrow')
        end
        it 'returns the reverse of an empty string' do 
            expect(reverse('')).to eq('')
        end
        it 'returns the reverse of a string with one character' do
            expect(reverse('a')).to eq('a')
        end
    end
    #add your code for the fizzbuzz
    
end
