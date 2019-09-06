defmodule Claim do

  defstruct id: nil, x: 0, y: 0, width: 0, height: 0

  def parse(claim) do
    [id, x, y, width, height] = Regex.run(~r/#(\d+)\s@\s(\d+),(\d+):\s(\d+)x(\d+)/, claim)
                                |> tl()
                                |> Enum.map(fn (value) -> String.to_integer(value) end)
    %Claim{id: id, x: x, y: y, width: width, height: height}
  end

  def plot_claim(claim, fabric) do
    new_plot = for x <- (claim.x + 1..claim.x + claim.width), y <- (claim.y + 1..claim.y + claim.height), into: %{}, do: {{x,y}, [claim.id]}
    Map.merge(fabric, new_plot, fn (_k, v1, v2) -> v1 ++ v2 end)
  end

  def max_x(claim) do
    claim.x + claim.width + 1
  end

  def max_y(claim) do
    claim.y + claim.height + 1
  end
end