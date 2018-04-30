defmodule DayFive do
  @input "./input"

  def how_many_nice_strings?(input \\ input) do
    input
    |> Enum.filter(&is_nice?/1)
    |> length
  end

  def how_many_really_nice_strings?(input \\ input) do
    input
    |> Enum.filter(&is_really_nice?/1)
    |> length
  end

  defp is_nice?(string) do
    has_vowels? = string =~ ~r/(.*[aeiou]){3}/
    has_duplicate? = string =~ ~r/(.)\1{1}/
    has_no_bad_pairs? = string =~ ~r/(ab|cd|pq|xy)/

    has_vowels? && has_duplicate? && !has_no_bad_pairs?
  end

  def is_really_nice?(string) do
    has_triple_pair? = string =~ ~r/(.).\1/
    has_no_overlap? = string =~ ~r/(..).*\1/

    has_triple_pair? && has_no_overlap?
  end

  defp input do
    @input
    |> File.read!
    |> String.strip
    |> String.split
  end
end
