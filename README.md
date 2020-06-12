# Code-MQL5
Códigos para Metatrader5 - Indicadores e Expert Advisor 

Indicador de Rompimento M15 + RSI

Backtesting realizado de 01/03/2020 - 08/06/2020
67 % de Ganho:
-- 56 Operações realizadas no total
-- 38 Operações com GAIN e 18 de LOSS

Media de GAIN por operação foi de 520 pontos e permitindo no maximo 350 pontos de LOSS
Maximo de GAIN consecutivos 13x
Maximo de LOSS consecutivos  5x
Operações realizadas das 9h às 12h

-- Consiste em:
  - Hilo de 4 periodos;
  - MME de 21 periodos;
  - RSI de 14 periodos;
  - Tempo grafico de 15 minutos;

-- ENTRADA na compra:
  -Fechamento do candle atual acima da MME, Hilo verde e RSI entre 50% a 100%
  ***(CUIDADO - entradas com RSI sobrecomprado ainda não feito backtest).
  
-- ENTRADA na venda:
  -Fechamento do candle atual abaixo da MME, Hilo vermelho e RSI entre 30% a 50%
  ***(CUIDADO - entradas com RSI sobrevendido ainda não feito backtest).
  
O indicador plota no grafico as seguintes setas:
  - Dourada apontando onde deve ser feita a entrada;
  - Vermelha apontando o Stop Loss;
  - Verde apontando o Gain;
