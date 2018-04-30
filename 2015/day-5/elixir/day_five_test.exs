ExUnit.start

Code.require_file("day_five.ex")

defmodule DayFourFive do
  use ExUnit.Case, async: true

  test "is nice because it has at least three vowels and a double letter" do
    count = DayFive.how_many_nice_strings?(["ugknbfddgicrmopn"])

    assert count == 1
  end

  test "is naughty because it has no double letter" do
    count = DayFive.how_many_nice_strings?(["jchzalrnumimnmhp"])

    assert count == 0
  end

  test "is naughty because it contains the forbidden string 'xy'" do
    count = DayFive.how_many_nice_strings?(["haegwjzuvuyypxyu"])

    assert count == 0
  end

  test "is naughty because it contains only one vowel" do
    count = DayFive.how_many_nice_strings?(["dvszwmarrgswjxmb"])

    assert count == 0
  end

  # Tests for really nice string (part two).

  test "is nice because it has pair appearing twice and a letter repeating with a letter between them" do
    count = DayFive.how_many_really_nice_strings?(["qjhvhtzxzqqjkmpb"])

    assert count == 1
  end

  test "is nice because it has pair appearing twice and a letter repeating, even overlaping the letter" do
    count = DayFive.how_many_really_nice_strings?(["xxyxx"])

    assert count == 1
  end

  test "is naughty because it has a pair but no repeat with a single letter between them" do
    count = DayFive.how_many_really_nice_strings?(["uurcxstgmygtbstg"])

    assert count == 0
  end

  test "is naughty because it has a repeating letter but no pair that appears twice" do
    count = DayFive.how_many_really_nice_strings?(["ieodomkazucvgmuy"])

    assert count == 0
  end
end
