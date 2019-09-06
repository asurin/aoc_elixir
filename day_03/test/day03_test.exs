defmodule Day03Test do
  use ExUnit.Case

  test "Part 1 Case 1 matches expected output" do
    input = ["#1 @ 1,3: 4x4", "#2 @ 3,1: 4x4", "#3 @ 5,5: 2x2"]
    assert Day03.find_claim_overlaps(input) == 4
  end
end
