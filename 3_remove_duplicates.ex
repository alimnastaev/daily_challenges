defmodule RemoveDuplicates do
  # Solution 1
  def one(items) do
    Enum.reduce(items, [], fn x, acc -> if x in acc, do: acc, else: [x] ++ acc end)
  end

  # Solution 2
  def two([]), do: []

  def two([head | tail]) do
    [head | for(x <- two(tail), x != head, do: x)]
  end
end

# TIMING

# Solution 1
{time, solution} =
  :timer.tc(fn ->
    RemoveDuplicates.one(["imposter", "syndrome", "imposter", "syndrome"])
  end)

IO.puts("One: using Enum.reduce : #{inspect(solution)}")
IO.puts("#{time / 1000} ms")

# Solution 2
{time, solution} =
  :timer.tc(fn ->
    RemoveDuplicates.two(["imposter", "syndrome", "imposter", "syndrome"])
  end)

IO.puts("Two: using recursive function: #{inspect(solution)}")
IO.puts("#{time / 1000} ms")
