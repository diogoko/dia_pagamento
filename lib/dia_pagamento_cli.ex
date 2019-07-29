defmodule DiaPagamento.CLI do
  def main(_args \\ []) do
    IO.puts("Mês    Adiant.    Pagamento")
    IO.puts("---------------------------")

    1..12
    |> Enum.map(&DiaPagamento.por_ano_mes(2019, &1))
    |> Enum.map(
      fn %{ano: _, mes: m, adiantamento: adiantamento, pagamento: pagamento} ->
        "#{m |> Integer.to_string |> String.pad_leading(2, "0")}     #{adiantamento |> Timex.format!("%d/%m", :strftime)}      #{pagamento |> Timex.format!("%d/%m", :strftime)}"
      end
    )
    |> Enum.map(&IO.puts/1)
  end
end
