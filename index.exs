#IO.puts(DiasUteis.feriado_bancario? ~D[2019-11-03])
#IO.puts(DiasUteis.final_de_semana? ~D[2019-07-27])
#IO.puts(DiasUteis.dia_util? ~D[2019-11-04])
#IO.inspect(Enum.take(DiasUteis.dias_uteis(~D[2019-07-23]), 5))
#IO.inspect(DiasUteis.contar_dias_uteis(~D[2019-12-01], 5))


ano = 2019

IO.puts("Mês    Adiant.    Pagamento")
IO.puts("---------------------------")
1..12
  |> Enum.map(&DiaPagamento.por_ano_mes(ano, &1))
  |> Enum.map(
    fn %{ano: _, mes: m, adiantamento: adiantamento, pagamento: pagamento} ->
      "#{m |> Integer.to_string |> String.pad_leading(2, "0")}     #{adiantamento |> Timex.format!("%d/%m", :strftime)}      #{pagamento |> Timex.format!("%d/%m", :strftime)}"
    end
  )
  |> Enum.map(&IO.puts/1)


# elixir
#Mês    Adiant.    Pagamento
#---------------------------
#06     24/05      07/06
#07     21/06      05/07
#08     24/07      07/08
#09     23/08      06/09
#10   <<23/09>>    07/10
#11     24/10      07/11
#12     22/11      06/12

# Python
#'''
#Mês    Adiant.    Pagamento
#--------------------------
#06                07/06
#07     21/06      05/07
#08     24/07      07/08
#09     23/08      06/09
#10   <<24/09>>    07/10
#11     24/10      07/11
#12     22/11      06/12
#'''
#
