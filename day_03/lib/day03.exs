Code.require_file "../lib/claim.exs", __DIR__

defmodule Day03 do
  def find_claim_overlaps(input) do
    input
    |> prepare_claim_map()
    |> Enum.filter(fn  ({_k, claims}) -> length(claims) > 1 end)
    |> length()
  end

  def find_unique_claim(input) do
    fabric = prepare_claim_map(input)
    ids_with_intersect = fabric
                         |> Enum.filter(fn  ({_k, claims}) -> length(claims) > 1 end)
                         |> Enum.flat_map(fn  ({_k, claims}) -> claims end)
                         |> Enum.uniq
    all_ids = fabric
              |> Enum.flat_map(fn  ({_k, claims}) -> claims end)
              |> Enum.uniq
    [result] = all_ids -- ids_with_intersect
    result
  end

  defp prepare_claim_map(input) do
    claims = parse_claims(input)
    fabric = generate_fabric(claims)
    claims
    |> Enum.reduce(fabric, fn (claim, fabric) -> Claim.plot_claim(claim, fabric) end)
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

  def load_file(path) do
    path
    |> File.read!()
    |> String.split("\n")
  end
end

IO.puts("Part One:")
"input.txt"
|> Day03.load_file()
|> Day03.find_claim_overlaps()
|> IO.inspect()

IO.puts("Part Two:")
"input.txt"
|> Day03.load_file()
|> Day03.find_unique_claim()
|> IO.inspect()
