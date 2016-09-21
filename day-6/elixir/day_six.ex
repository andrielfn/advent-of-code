defmodule DaySix do
  @input "./input"

  def how_many_lights_are_lit? do
    grid = :ets.new(:grid, [:set, :named_table])

    input
    |> Enum.reduce(grid, fn(inst, grid) -> inst |> String.split |> turn(grid); grid end)
    |> :ets.tab2list
    |> Enum.reduce(0, fn({_k, v}, acc) -> if v == true, do: acc + 1, else: acc end)
    |> IO.inspect
  end

  defp turn(["turn", "on", start_pos, _, end_pos], grid) do
    {xs, ys} = str_to_pos(start_pos)
    {xe, ye} = str_to_pos(end_pos)

    for x <- xs..xe, y <- ys..ye, do: :ets.insert(grid, {{x, y}, true})
  end

  defp turn(["turn", "off", start_pos, _, end_pos], grid) do
    {xs, ys} = str_to_pos(start_pos)
    {xe, ye} = str_to_pos(end_pos)

    for x <- xs..xe, y <- ys..ye, do: :ets.insert(grid, {{x, y}, false})
  end

  defp turn(["toggle", start_pos, _, end_pos], grid) do
    {xs, ys} = str_to_pos(start_pos)
    {xe, ye} = str_to_pos(end_pos)

    for x <- xs..xe, y <- ys..ye do
      pos = {x, y}

      new_val = case :ets.lookup(grid, pos) do
        [] -> {pos, true}
        [{^pos, val}] -> {pos, !val}
      end

      :ets.insert(grid, new_val)
    end
  end

  defp str_to_pos(str) do
    str
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  defp input do
    @input
    |> File.read!
    |> String.split("\n", trim: true)
  end
end

DaySix.how_many_lights_are_lit?
