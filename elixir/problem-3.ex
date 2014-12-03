# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

defmodule ProblemThree do
  def factors_for(n) do
    1..(round(n/2)) |> Enum.filter &(rem(n,&1) == 0)
  end

  def is_prime?(n) do
    length(factors_for n) == 2
  end

  def prime_factors_for(n) do
    factors_for(n) |> Stream.filter &(!is_prime? &1)
  end
end

IO.puts Enum.max ProblemThree.prime_factors_for 600851475