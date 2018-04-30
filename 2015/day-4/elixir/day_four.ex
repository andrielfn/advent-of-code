defmodule DayFour do
  def mine(key, leading_zeros \\ "00000", count \\ 1) do
    :crypto.hash(:md5, key <> to_string(count))
    |> Base.encode16
    |> String.starts_with?(leading_zeros)
    |> case do
      true -> count
      false -> mine(key, leading_zeros, count + 1)
    end
  end
end
