ExUnit.start

Code.require_file("day_eight.ex")

defmodule DayEightTest do
  use ExUnit.Case

  test "returns the string length minus the number of characteres" do
    assert DayEight.number_of_chars("\"qsmzhnx\\\"\"") == 3
  end

  test "returns the encoded string length minus the string length" do
    assert DayEight.number_of_encoded_chars("\"qsmzhnx\\\"\"") == 6
  end
end
