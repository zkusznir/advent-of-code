defmodule Frequency do
  def evaluate do
    "data.txt"
      |> File.open!
      |> IO.stream(:line)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum
  end
end
