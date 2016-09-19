ExUnit.start

Code.require_file("day_four.ex")

defmodule DayFourTest do
  use ExUnit.Case, async: true

  test "mines the given secret key with default 5 leading zeros" do
    result = DayFour.mine("iwrupvqb")

    assert result == 346386
  end

  test "mines the given secret key with 6 leading zeros" do
    result = DayFour.mine("iwrupvqb", "000000")

    assert result == 9958218
  end
end
