defmodule DaySeven do
  use Bitwise

  @input "./input"

  def what_signal_is_provided_to_wire_a? do
    :ets.new(:node_table, [:named_table, :set])

    circuit = init_circuit

    signal(:a, circuit)
    |> eval(circuit)
    |> IO.inspect
  end

  defp eval([wire], _) when is_integer(wire) do
    wire
  end

  defp eval([wire], circuit) do
    value = signal(wire, circuit) |> eval(circuit)

    :ets.insert(:node_table, {wire, [value]})

    value
  end

  defp eval([l_wire, gate, r_wire], circuit) do
    l_value = signal(l_wire, circuit) |> eval(circuit)
    r_value = signal(r_wire, circuit) |> eval(circuit)

    IO.inspect {l_wire, [l_value]}
    IO.inspect {r_wire, [r_value]}
    :ets.insert(:node_table, {l_wire, [l_value]})
    :ets.insert(:node_table, {r_wire, [r_value]})

    case gate do
      :OR -> bor l_value, r_value
      :LSHIFT -> bsl l_value, r_value
      :RSHIFT -> bsr l_value, r_value
      :AND -> band l_value, r_value
    end
  end

  defp eval([gate, wire], circuit) do
    value = signal(wire, circuit) |> eval(circuit)

    IO.inspect {wire, [value]}
    :ets.insert(:node_table, {wire, [value]})

    bnot value
  end

  defp signal(wire, _) when is_integer(wire), do: [wire]
  defp signal(wire, circuit) when is_atom(wire) do
    value = :ets.lookup(:node_table, wire)

    IO.inspect value

    case value do
      [] -> circuit[wire]
      [result|_] -> elem(result, 1)
    end
  end

  defp init_circuit do
    operations
    |> Enum.reduce(Map.new, fn(operation, map) ->
      {k, v} = operation
        |> String.split
        |> build_operation
      Map.put(map, k, v)
    end)
  end

  defp build_operation([v1, op, v2, "->", v3]), do: {cast(v3), [cast(v1), cast(op), cast(v2)]}
  defp build_operation([v1, "->", v2]), do: {cast(v2), [cast(v1)]}
  defp build_operation([op, v1, "->", v2]), do: {cast(v2), [cast(op), cast(v1)]}

  defp cast(value) do
    if Regex.match?(~r/\d+/, value) do
      String.to_integer(value)
    else
      String.to_atom(value)
    end
  end

  defp operations do
    @input
    |> File.read!
    |> String.split("\n", trim: true)
  end
end

DaySeven.what_signal_is_provided_to_wire_a?
