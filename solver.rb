class Solver
    def factorial(n)
        raise ArgumentError,'N must be a non-negatve integer' if n < 0
        return 1 if n == 0
        (1..n).reduce(:*)
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
end