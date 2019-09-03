defmodule D01 do

  def find_final_frequency(input, start \\ 0) do
    [Integer.to_string(start) | input]
    |> IO.inspect()
    |> Enum.map(&(String.replace_prefix(&1, "+", "")))
    |> Enum.map(&(String.to_integer(&1)))
    |> IO.inspect
    |> Enum.sum()
  end

  def 

  def find_repeating_frequency(input, last_frequency \\ 0, frequencies \\ %{}) do
    new_freq = find_final_frequency(input, last_frequency)
    if frequencies[last_frequency] do
      new_freq
    else
      find_repeating_frequency(input, new_freq, Map.put(frequencies, last_frequency, true))
    end
  end

  def load_file(path) do
    path
    |> File.read!()
    |> String.split("\n")
  end

end

if Mix.env != :test do
  "input.txt"
  |> D01.load_file()
  |> D01.find_final_frequency()
  |> IO.inspect()
end