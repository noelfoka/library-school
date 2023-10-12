require 'rspec'
require_relative '../solver'

describe Solver do
  let(:solver) { Solver.new }
  describe '#factorial' do
    it 'Returns the factorial of 5' do
      expect(solver.factorial(5)).to eq(120)
    end
    it 'Returns the factorial of 0' do
      expect(solver.factorial(0)).to eq(1)
    end
    it 'returns the factorial of 1' do
      expect(solver.factorial(1)).to eq(1)
    end
    it 'returns the factorial of 10' do
      expect(solver.factorial(10)).to eq(3_628_800)
    end
    it 'riases an error when a negative number is passed' do
      expect { solver.factorial(-1) }.to raise_error(ArgumentError, 'N must be a non-negatve integer')
    end
  end

  describe '#reverse' do
    it 'returns the reverse of "hello"' do
      expect(solver.reverse('hello')).to eq('olleh')
    end
    it 'returns the reverse of "world"' do
      expect(solver.reverse('world')).to eq('dlrow')
    end
    it 'returns the reverse of an empty string' do
      expect(solver.reverse('')).to eq('')
    end
    it 'returns the reverse of a string with one character' do
      expect(solver.reverse('a')).to eq('a')
    end
  end
  describe '#fizzbuzz' do
    it 'returns "fizz" for numbers divisible by 3' do
      expect(solver.fizzbuzz(3)).to eq('fizz')
      expect(solver.fizzbuzz(6)).to eq('fizz')
    end
    it 'returns "buzz" for numbers divisible by 5' do
      expect(solver.fizzbuzz(5)).to eq('buzz')
      expect(solver.fizzbuzz(10)).to eq('buzz')
    end
    it 'returns "fizzbuzz" for numbers divisible by 3 and 5' do
      expect(solver.fizzbuzz(15)).to eq('fizzbuzz')
      expect(solver.fizzbuzz(30)).to eq('fizzbuzz')
    end
  end
end