defmodule Day03 do
  def find_claim_overlaps(input) do
    claims = parse_claims(input)
    fabric = generate_fabric(claims)
    fabric = claims
             |> Enum.reduce(fabric, fn (claim, fabric) -> Claim.plot_claim(claim, fabric) end)
    IO.inspect(fabric)
  end

  def generate_fabric(claims) do
    max_x = claims
            |> Enum.map(fn (claim) -> Claim.max_x(claim) end)
            |> Enum.max()
    max_y = claims
            |> Enum.map(fn (claim) -> Claim.max_y(claim) end)
            |> Enum.max()
    for x <- (0..max_x), y <- (0..max_y), into: %{}, do: {{x,y}, []}
  end

  def parse_claims(input) do
    input
    |> Enum.map(fn (claim) -> Claim.parse(claim) end)
  end
end
