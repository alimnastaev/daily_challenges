defmodule StringPeeler do
  @doc """
  11.17.2019

  :timer
  http://erlang.org/doc/man/timer.html#tc-2
  Returns {Time, Value}:
  - where Time is the elapsed real time in microseconds,
  - Value is what is returned from the apply.
  """

  # 1.
  # https://hexdocs.pm/elixir/guards.html
  def del_first_last_1(str) when byte_size(str) <= 2,
    do: "length of a string should be more then two characters!"

  def del_first_last_1(str) do
    String.slice(str, 1..-2)
  end

  # 2.
  # https://elixir-lang.org/getting-started/case-cond-and-if.html
  def del_first_last_2(str) do
    if byte_size(str) <= 2 do
      "length of a string should be more then two characters!"
    else
      String.slice(str, 1..-2)
    end
  end

  # 3.
  # https://elixir-lang.org/getting-started/case-cond-and-if.html#if-and-unless
  # https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors
  def del_first_last_3(str) do
    unless byte_size(str) > 2 do
      raise "length of a string should be more then two characters!"
    end

    String.slice(str, 1..-2)
  end

  # 4.
  # https://elixir-lang.org/getting-started/case-cond-and-if.html#toc
  def del_first_last_4(str) do
    case byte_size(str) <= 2 do
      true -> "length of a string should be more then two characters!"
      _ -> String.slice(str, 1..-2)
    end
  end

  # 5.
  # https://elixir-lang.org/getting-started/case-cond-and-if.html#cond
  def del_first_last_5(str) do
    cond do
      byte_size(str) <= 2 -> "length of a string should be more then two characters!"
      true -> String.slice(str, 1..-2)
    end
  end
end

{time, solution} =
  :timer.tc(fn ->
    StringPeeler.del_first_last_1(
      "weeeeeeeeeethsheisdhjfherorjrjk1166egdshsdbsdhjbsdhjbhjeeeeeeeeeew"
    )
  end)

IO.puts("1. with MULTIPLE CLAUSES: #{solution}")
IO.puts("#{time / 1000} ms")

{time, solution} =
  :timer.tc(fn ->
    StringPeeler.del_first_last_2(
      "weeeeeeeeeethsheisdhjfherorjrjk1166egdshsdbsdhjbsdhjbhjeeeeeeeeeew"
    )
  end)

IO.puts("2. with IF ELSE statement: #{solution}")
IO.puts("#{time / 1000} ms")

{time, solution} =
  :timer.tc(fn ->
    StringPeeler.del_first_last_3(
      "weeeeeeeeeethsheisdhjfherorjrjk1166egdshsdbsdhjbsdhjbhjeeeeeeeeeew"
    )
  end)

IO.puts("3. with UNLESS and RAISE: #{solution}")
IO.puts("#{time / 1000} ms")

{time, solution} =
  :timer.tc(fn ->
    StringPeeler.del_first_last_4(
      "weeeeeeeeeethsheisdhjfherorjrjk1166egdshsdbsdhjbsdhjbhjeeeeeeeeeew"
    )
  end)

IO.puts("4. with CASE statement: #{solution}")
IO.puts("#{time / 1000} ms")

{time, solution} =
  :timer.tc(fn ->
    StringPeeler.del_first_last_5(
      "weeeeeeeeeethsheisdhjfherorjrjk1166egdshsdbsdhjbsdhjbhjeeeeeeeeeew"
    )
  end)

IO.puts("5. with COND statement: #{solution}")
IO.puts("#{time / 1000} ms")
