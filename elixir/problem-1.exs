# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

defmodule ProblemOne do

  def sum(n, accum) when n == 1000 do
    IO.puts accum
  end

  def sum(n, accum) when rem(n, 3) == 0 do
    sum(n+1, accum + n)
  end

  def sum(n, accum) when rem(n, 5) == 0 do
    sum(n+1, accum + n)
  end

  def sum(n, accum) do
    sum(n+1, accum)
  end
end

ProblemOne.sum(1, 0)
