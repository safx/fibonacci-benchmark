
defmodule Fibonacci do
  def fib(n) when n < 2 do
      n
  end

  def fib(n) do
      fib(n - 1) + fib(n - 2)
  end
end

if System.argv != [] do
  IO.puts Fibonacci.fib(String.to_integer(List.first(System.argv())))
end
