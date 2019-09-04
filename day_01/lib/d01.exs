defmodule D01 do

  def find_final_frequency(input) do
    input
    |> input_to_integers()
    |> Enum.sum()
  end

  def find_repeating_frequency(input) do
    integers = input_to_integers(input)
    find_repeating_frequency(integers, 0, integers, %{})
  end
  defp find_repeating_frequency([], current_frequency, frequency_list, %{} = frequencies), do: find_repeating_frequency(frequency_list, current_frequency, frequency_list, frequencies)
  defp find_repeating_frequency([item | remaining_items], current_frequency, frequency_list, %{} = frequencies) do
    new_freq = current_frequency + item
    if frequencies[new_freq] do
      new_freq
    else
      find_repeating_frequency(remaining_items, new_freq, frequency_list, Map.put(frequencies, current_frequency, true))
    end
  end

  def load_file(path) do
    path
    |> File.read!()
    |> String.split("\n")
  end

  defp input_to_integers(input) do
    input
    |> Enum.map(&(String.replace_prefix(&1, "+", "")))
    |> Enum.map(&(String.to_integer(&1)))
  end
end

IO.puts("Part One:")
"input.txt"
|> D01.load_file()
|> D01.find_final_frequency()
|> IO.inspect()

IO.puts("Part Two:")
"input.txt"
|> D01.load_file()
|> D01.find_repeating_frequency()
|> IO.inspect()