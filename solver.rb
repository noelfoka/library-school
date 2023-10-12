class Solver
  def factorial(num)
    raise ArgumentError, 'N must be a non-negatve integer' if num.negatve?
    return 1 if num.zero?

    (1..num).reduce(:*)
  end

  def reverse(word)
    reversed_word = ''
    i = word.length - 1
    while i >= 0
      reversed_word += word[i]
      i -= 1
    end
    reversed_word
  end

  def fizzbuzz(num)
    result = ''
    result += 'fizz' if num % 3.zero?
    result += 'buzz' if num % 5.zero?
    result = n.to_s if result == ''
    result
  end
end
