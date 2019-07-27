defmodule DiasUteisTest do
  use ExUnit.Case
  doctest DiasUteis

  test "obtém sequência de dias úteis crescentes" do
    assert DiasUteis.dias_uteis(~D[2019-07-24]) |> Enum.take(5) |> Enum.to_list()
      == [~D[2019-07-24], ~D[2019-07-25], ~D[2019-07-26], ~D[2019-07-29], ~D[2019-07-30]]
  end

  test "obtém sequência de dias úteis decrescentes" do
    assert DiasUteis.dias_uteis(~D[2019-07-24], -1) |> Enum.take(5) |> Enum.to_list()
      == [~D[2019-07-24], ~D[2019-07-23], ~D[2019-07-22], ~D[2019-07-19], ~D[2019-07-18]]
  end

  test "conta dias úteis crescentes" do
    assert DiasUteis.contar_dias_uteis(~D[2019-07-24], 5)
      == ~D[2019-07-30]
  end

  test "conta dias úteis decrescentes" do
    assert DiasUteis.contar_dias_uteis(~D[2019-07-24], 5, -1)
      == ~D[2019-07-18]
  end
end
