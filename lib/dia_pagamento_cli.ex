defmodule DiaPagamento.CLI do
  def main(_args \\ []) do
    IO.puts("Mês    Adiant.    Pagamento")
    IO.puts("---------------------------")

    1..12
    |> Enum.map(&DiaPagamento.por_ano_mes(2019, &1))
    |> Enum.map(
      fn %{ano: _, mes: mes, adiantamento: adiantamento, pagamento: pagamento} ->
        "#{mes_formatado(mes)}     #{dia_formatado(adiantamento)}      #{dia_formatado(pagamento)}"
      end
    )
    |> Enum.map(&IO.puts/1)
  end

  defp mes_formatado(mes) do
    mes
    |> Integer.to_string()
    |> String.pad_leading(2, "0")
  end

  defp dia_formatado(dia) do
    dia
    |> Timex.format!("%d/%m", :strftime)
  end
end
