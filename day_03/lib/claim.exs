defmodule Claim do

  defstruct id: nil, x: 0, y: 0, width: 0, height: 0

  def parse(claim) do
    [id, x, y, width, height] = Regex.run(~r/#(\d+)\s@\s(\d+),(\d+):\s(\d+)x(\d+)/, claim)
                                |> tl()
                                |> Enum.map(fn (value) -> String.to_integer(value) end)
    %Claim{id: id, x: x, y: y, width: width, height: height}
  end

  def plot_claim(claim, fabric) do
    start_x = claim.x
    end_x = claim.x + claim.width
    Enum.each(start_x..end_x, fn (x) ->
      Enum.each(claim.y..claim.y + claim.height, fn (y) ->
        key = {x, y}
        value = Map.get(fabric, key)
        value = [claim.id | value]
        Map.put(fabric, key, value)
      end)
    end)
    fabric
  end

  def max_x(claim) do
    claim.x + claim.width + 1
  end

  def max_y(claim) do
    claim.y + claim.height + 1
  end
end