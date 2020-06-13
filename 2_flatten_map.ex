defmodule Flatten do
  # Solution 1
  def one(input) do
    cond do
      input.children == nil -> [%{id: input.id}]
      true -> [%{id: input.id}] ++ Enum.map(input.children, fn x -> x end)
    end
  end

  # Solution 2
  def two(input) do
    Enum.reduce(input, [], fn x, acc ->
      if is_list(elem(x, 1)) do
        Enum.map(elem(x, 1), fn map -> map end) ++ acc
      else
        if acc == [%{id: input.id}],
          do: acc,
          else: [%{id: input.id}] ++ acc
      end
    end)
  end
end

# TIMING

# Solution 1
{time, solution} =
  :timer.tc(fn ->
    Flatten.one(%{children: [%{id: "qwe"}, %{id: "tyu"}], id: "asd"})
  end)

IO.puts("One: using COND and children is a list of maps: #{inspect(solution)}")
IO.puts("#{time / 1000} ms")

{time, solution} =
  :timer.tc(fn ->
    Flatten.one(%{children: nil, id: "asd"})
  end)

IO.puts("One: using COND and children is nil: #{inspect(solution)}")
IO.puts("#{time / 1000} ms")

# Solution 2
{time, solution} =
  :timer.tc(fn ->
    Flatten.two(%{children: [%{id: "qwe"}, %{id: "tyu"}], id: "asd"})
  end)

IO.puts("Two: using Enum.reduce and children is a list of maps: #{inspect(solution)}")
IO.puts("#{time / 1000} ms")

{time, solution} =
  :timer.tc(fn ->
    Flatten.two(%{children: nil, id: "asd"})
  end)

IO.puts("Two: using Enum.reduce and children is nil: #{inspect(solution)}")
IO.puts("#{time / 1000} ms")
