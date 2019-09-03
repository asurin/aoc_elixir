defmodule D01Test do
  use ExUnit.Case

  test "part one matches example one" do
    input = ["+1", "-2", "+3", "+1"]
    assert D01.find_final_frequency(input) == 3
  end

  test "part one matches example two" do
    input = ["+1", "+1", "+1"]
    assert D01.find_final_frequency(input) == 3
  end

  test "part one matches example three" do
    input = ["+1", "+1", "-2"]
    assert D01.find_final_frequency(input) == 0
  end

  test "part one matches example four" do
    input = ["-1", "-2", "-3"]
    assert D01.find_final_frequency(input) == -6
  end

  test "part two matches example one" do
    input =  ["+1", "-2", "+3", "+1"]
    assert D01.find_repeating_frequency(input) == 2
  end

  test "part two matches example two" do
    input = ["+1", "-1"]
    assert D01.find_repeating_frequency(input) == 0
  end

  test "part two matches example three" do
    input = ["+3", "+3", "+4", "-2", "-4"]
    assert D01.find_repeating_frequency(input) == 10
  end
  test "part two matches example four" do
    input = ["-6", "+3", "+8", "+5", "-6"]
    assert D01.find_repeating_frequency(input) == 5
  end
  test "part two matches example five" do
    input = ["+7", "+7", "-2", "-7", "-4"]
    assert D01.find_repeating_frequency(input) == 14
  end
end
