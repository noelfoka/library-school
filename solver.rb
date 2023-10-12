class Solver
    def factorial(n)
        raise ArgumentError,'N must be a non-negatve integer' if n < 0
        return 1 if n == 0
        (1..n).reduce(:*)
    end
end