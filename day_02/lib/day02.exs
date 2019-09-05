defmodule Day02 do
  def generate_checksum(input) do
    count_with_n_cases(input, 2) * count_with_n_cases(input, 3)
  end

  defp count_with_n_cases(input, count) do
    input
    |> Enum.map(fn(string) -> if has_n_cases_of_a_letter?(string, count), do: 1, else: 0 end)
    |> Enum.sum()
  end

  defp has_n_cases_of_a_letter?(input, count) do
    String.graphemes(input)
    |> Enum.reduce(%{}, fn(c, acc) -> Map.put(acc, c, (acc[c] || 0) + 1) end)
    |> Enum.find_value(false, fn({_, v}) -> v == count end)
  end

  def find_commonality(input) do
    Enum.find_value(input, fn (left) -> compare_to_other_strings(left, input) end)
  end

  defp compare_to_other_strings(left, right_list) do
    Enum.find_value(right_list, fn(right) -> compare_to_string(left, right) end)
  end

  def compare_to_string(left, right) do
    left_graphemes = String.graphemes(left)
    right_graphemes = String.graphemes(right)
    delta = compare_to_string(left_graphemes, right_graphemes, 0)
    if delta == 1 do
      Enum.zip(left_graphemes, right_graphemes)
      |> Enum.filter(fn({l, r}) -> l == r end)
      |> Enum.map(fn({l, _}) -> l end)
      |> Enum.join("")
    else
      false
    end
  end
  defp compare_to_string([h1 | t1], [h2 | t2], divergence) do
    different = if h1 == h2, do: 0, else: 1
    compare_to_string(t1, t2, divergence + different)
  end
  defp compare_to_string([], [], divergence), do: divergence

  def load_file(path) do
    path
    |> File.read!()
    |> String.split("\n")
  end
end

IO.puts("Part One:")
"input.txt"
|> Day02.load_file()
|> Day02.generate_checksum()
|> IO.inspect()

IO.puts("Part Two:")
"input.txt"
|> Day02.load_file()
|> Day02.find_commonality()
|> IO.inspect()
