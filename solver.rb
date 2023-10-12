class Solver
  def factorial(num)
    raise ArgumentError, 'N must be a non-negatve integer' if num < 0
    return 1 if num == 0

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
    result += 'fizz' if num % 3 == 0
    result += 'buzz' if (num % 5) == 0
    result = n.to_s if result == ''
    result
  end
end
