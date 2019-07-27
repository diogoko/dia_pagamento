

defmodule DiaPagamentoTest do
  use ExUnit.Case
  doctest DiaPagamento

  test "traz os dados de 07/2019" do
    %{adiantamento: dia_adiantamento, pagamento: dia_pagamento} = DiaPagamento.por_ano_mes(2019, 7)
    assert Timex.equal?(dia_adiantamento, ~D[2019-06-21])
    assert Timex.equal?(dia_pagamento, ~D[2019-07-05])
  end
end
