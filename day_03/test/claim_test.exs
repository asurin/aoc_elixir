defmodule ClaimTest do
  use ExUnit.Case

  test "parsed claim has expected values" do
    input = "#1 @ 2,3: 4x5"
    assert Claim.parse(input) == %Claim{id: 1, x: 2, y: 3, width: 4, height: 5}
  end
end