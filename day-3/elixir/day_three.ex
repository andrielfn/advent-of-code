defmodule DayThree do
  @input "./input"

  def how_many_won_a_present?(moves \\ moves) do
    moves
    |> deliver(MapSet.new, 0, 0)
    |> MapSet.size
  end

  def how_many_won_a_present_with_robo_santa?(moves \\ moves) do
    santa = moves
    |> String.split("", trim: true)
    |> Enum.take_every(2)
    |> Enum.join
    |> deliver(MapSet.new, 0, 0)

    robo_santa = moves
    |> String.split("", trim: true)
    |> Enum.drop(1)
    |> Enum.take_every(2)
    |> Enum.join
    |> deliver(MapSet.new, 0, 0)

    MapSet.union(santa, robo_santa)
    |> MapSet.size
  end

  def deliver("^" <> moves, map, x, y) do
    map = MapSet.put(map, {x , y + 1})
    deliver(moves, map, x , y + 1)
  end

  def deliver("v" <> moves, map, x, y) do
    map = MapSet.put(map, {x , y - 1})
    deliver(moves, map, x, y - 1)
  end

  def deliver("<" <> moves, map, x, y) do
    map = MapSet.put(map, {x - 1 , y})
    deliver(moves, map, x - 1, y)
  end

  def deliver(">" <> moves, map, x, y) do
    map = MapSet.put(map, {x + 1 , y})
    deliver(moves, map, x + 1, y)
  end

  def deliver(_, map, _x, _y), do: map

  defp moves do
    @input
    |> File.read!
    |> String.strip
  end
end
