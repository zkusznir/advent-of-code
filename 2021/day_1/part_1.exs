defmodule Counter do
  def compare_and_count([first, second | tail], total) do
    total = if first < second, do: total + 1, else: total
    compare_and_count([second | tail], total)
  end

  def compare_and_count(_number, total) do
    total
  end
end

{:ok, content} = File.read("data.txt")
numbers        = content |> String.split("\n") |> Enum.map(&String.to_integer/1)

IO.puts Counter.compare_and_count(numbers, 0)
