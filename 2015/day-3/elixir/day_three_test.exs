ExUnit.start

Code.require_file("day_three.ex")

defmodule DayThreeTest do
  use ExUnit.Case

  test "delivers one present when go to north (^)" do
    deliveries = DayThree.how_many_won_a_present?("v")

    assert deliveries == 1
  end

  test "delivers one present when go to west (<)" do
    deliveries = DayThree.how_many_won_a_present?("<")

    assert deliveries == 1
  end

  test "delivers one present when go to east (>)" do
    deliveries = DayThree.how_many_won_a_present?(">")

    assert deliveries == 1
  end

  test "delivers one present when go to south (v)" do
    deliveries = DayThree.how_many_won_a_present?("v")

    assert deliveries == 1
  end

  test "does not count duplicated deliveries in the same house" do
    deliveries = DayThree.how_many_won_a_present?("<><")

    assert deliveries == 2
  end
end
