defmodule Day02Test do
  use ExUnit.Case

  test "Generates the correct checksum for part 1, case 1" do
    input = ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"]
    assert Day02.generate_checksum(input) == 12
  end

  test "Detects a difference of one character in strings" do
    assert Day02.compare_to_string("abc", "abd") == "ab"
  end

  test "Rejects a difference of two characters in strings" do
    assert Day02.compare_to_string("abc", "ade") == false
  end

  test "Finds the closest ids and commonality for part 2, case 1" do
    input = ["abcde", "fghij", "klmno", "pqrst", "fguij", "axcye", "wvxyz"]
    assert Day02.find_commonality(input) == "fgij"
  end
end
