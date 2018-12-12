defmodule Frequency do
  def evaluate do
    "data.txt"
      |> File.open!
      |> IO.stream(:line)
      |> Enum.map(&String.trim/1)
      |> Integer.parse
      |> Enum.sum
  end
end
