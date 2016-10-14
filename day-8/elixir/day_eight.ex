defmodule DayEight do
  @input "./input"

  def number_of_chars(input \\ input) do
    input
    |> String.split
    |> Enum.reduce(0, &(parse_string(&1) + &2))
  end

  def number_of_encoded_chars(input \\ input) do
    input
    |> String.split
    |> Enum.reduce(0, &(parse_encoded_string(&1) + &2))
  end

  defp parse_string(string) do
    String.length(string) - eval_string_length(string)
  end

  defp parse_encoded_string(string) do
    String.length(Macro.to_string(string)) - String.length(string)
  end

  defp eval_string_length(string) do
    string
    |> Code.eval_string
    |> eval_length
  end

  defp eval_length({nil, _}), do: 0
  defp eval_length({str, _}), do: String.length(str)

  defp input do
    File.read!(@input)
  end
end
