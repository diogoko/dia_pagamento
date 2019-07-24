defmodule DiasUteis do
  defp feriados_bancarios do
    # https://feriadosbancarios.febraban.org.br/feriados_show.asp -- municipais
    # https://feriadosbancarios.febraban.org.br/ -- federais
    Enum.map(~W(
      09/07/2019
      08/12/2019
      01/01/2019
      04/03/2019
      05/03/2019
      19/04/2019
      21/04/2019
      01/05/2019
      20/06/2019
      07/09/2019
      12/10/2019
      02/11/2019
      15/11/2019
      25/12/2019
      31/12/2019
    ), fn x -> Timex.parse!(x, "%d/%m/%Y", :strftime) end)
  end

  @doc """
  Verifica se uma data é um feriado bancário.

  ## Exemplos

      iex> DiasUteis.feriado_bancario? ~D[2019-07-23]
      false
      iex> DiasUteis.feriado_bancario? ~D[2019-11-02]
      true
      iex> DiasUteis.feriado_bancario? ~D[2019-11-03]
      false
  """
  def feriado_bancario?(dia) do
    Enum.any?(feriados_bancarios(), fn x -> Timex.equal?(x, dia) end)
  end

  @doc """
  Verifica se um dia cai no final de semana.

  ## Exemplos

      iex> DiasUteis.final_de_semana? ~D[2019-07-23]
      false
      iex> DiasUteis.final_de_semana? ~D[2019-07-21]
      true
  """
  def final_de_semana?(dia) do
    weekday_sabado = 6
    weekday_domingo = 7
    Timex.weekday(dia) in [weekday_sabado, weekday_domingo]
  end

  def dia_util?(dia) do
    not (final_de_semana?(dia) or feriado_bancario?(dia))
  end

  def dias_uteis(dia, delta \\ 1) do
    Stream.iterate(dia, fn x -> Timex.shift(x, [days: delta]) end)
      |> Stream.filter(fn x -> dia_util?(x) end)
  end

  def contar_dias_uteis(dia, qtde, delta \\ 1) do
    dias_uteis(dia, delta)
      |> Enum.at(qtde - 1)
  end

end