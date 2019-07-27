defmodule DiaPagamento do
  def por_ano_mes(ano, mes) do
    with primeiro_dia_mes <- Timex.beginning_of_month(ano, mes),
         quinto_dia_util  <- DiasUteis.contar_dias_uteis(primeiro_dia_mes, 5),
         dez_dias_antes   <- DiasUteis.contar_dias_uteis(Timex.shift(quinto_dia_util, [days: -1]), 10, -1) do
      %{
        ano: ano,
        mes: mes,
        adiantamento: dez_dias_antes,
        pagamento: quinto_dia_util
      }
    end
  end
end
