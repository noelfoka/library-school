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
end