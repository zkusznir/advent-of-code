defmodule Letters do
  def evaluate(data \\ file_data) do
    data
      |> Enum.map(&String.trim/1)
      |> Enum.map(&word_stats/1)
      |> multiples_count
      |> Enum.reduce(1, fn elem, score -> score * elem end)
  end

  defp file_data do
    "data.txt" |> File.open! |> IO.stream(:line)
  end

  defp word_stats(word) do
    word |> count_letters |> count_triples_doubles
  end

  def count_letters(word) do
    word |> String.graphemes |> stats
  end

  def count_triples_doubles(letters_stats) do
    letters_stats |> Map.values |> stats
  end

  def multiples_count(words_stats) do
    [multilple_count(words_stats, &doubles/1), multilple_count(words_stats, &triples/1)]
  end

  defp stats(values) do
    values
      |> Enum.reduce(%{}, fn count, map -> Map.update(map, count, 1, &(&1 + 1)) end)
  end

  defp multilple_count(words_stats, evaluator) do
    words_stats
      |> Enum.reduce(0, fn stats, count -> count + evaluator.(stats) end)
  end

  defp doubles(word_stats = %{2 => 0}), do: 0

  defp doubles(word_stats = %{2 => _}), do: 1

  defp doubles(_), do: 0

  defp triples(word_stats = %{3 => 0}), do: 0

  defp triples(word_stats = %{3 => _}), do: 1

  defp triples(_), do: 0
end
