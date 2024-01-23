#!/usr/bin/env python
# coding: utf-8

# In[35]:


# Bibliotecas utilizadas para o código
import MetaTrader5 as mt5
import pandas as pd
import time
import numpy as np
# Acesso ao MetaTrader 5
# 1 - Abrir a plataforma do meta trader
mt5.initialize()
# 2 - Login na conta de trader
conta = 3005334925
autorizacao = mt5.login(conta, password="0m4uYUhw")


# In[36]:


# Dados modificáveis
ticker = 'WING24'
quantidade_de_ativos = 1.0
temp_grafico = mt5.TIMEFRAME_M5
quant_candle = 4
stop_loss_compra = 300
stop_gain_compra = 100

# Acesso ao DataFrame do gráfico escolhido
dados_ativo = pd.DataFrame(mt5.copy_rates_from_pos(ticker,temp_grafico, 0, quant_candle)) # dados graficos do ativo escolhodo para analise
dados_ativo['time'] = pd.to_datetime(dados_ativo['time'], unit = "s") # ajustando a tipagem da coluna "time"
dados_ativo


# In[37]:


dados_ativo['cor_clander'] = np.where(dados_ativo['close'] >= dados_ativo['open'], 'Azul', 'Vermelho')
dados_ativo


# In[38]:


# Cores do Candles analisados
primeiro_candle = list(dados_ativo['cor_clander'])[-2]
segundo_candle = list(dados_ativo['cor_clander'])[-3]
teceiro_candle = list(dados_ativo['cor_clander'])[-4]


# In[39]:


# ================================================== Criação das colunas com as informações daS BANDAS_DE_BOLLINGS =====================================================
# Acesso ao DataFrame do gráfico escolhido
dados_ativo2 = pd.DataFrame(mt5.copy_rates_from_pos(ticker,temp_grafico, 0, 100)) # dados graficos do ativo escolhodo para analise
dados_ativo2['time'] = pd.to_datetime(dados_ativo2['time'], unit = "s") # ajustando a tipagem da coluna "time"
dados_ativo2

def banda_de_bolling(dados_ativo2, period=20, std_factor=2):
    dados_ativo2['std'] = dados_ativo2['close'].rolling(period).std()
    dados_ativo2['mean'] = dados_ativo2['close'].rolling(period).mean()
    dados_ativo2['banda_superior'] = dados_ativo2['mean'] + dados_ativo2['std'] * std_factor
    dados_ativo2['banda_inferior'] = dados_ativo2['mean'] - dados_ativo2['std'] * std_factor
banda_de_bolling(dados_ativo2)
dados_ativo2.iloc[20:]
dados_ativo2


# In[ ]:


# A abertura do candle tem que ser maior que a Média (linha) do meio
media_meio = list(dados_ativo2['high'])[-2]


# In[33]:


if (segundo_candle or teceiro_candle) == 'Vermelho':
    print('Sim! 1 dos dois candles é vermelho!')
    # O Candle de entrada do trader é na Max do "primeiro_candle"
    preco = list(dados_ativo['high'])[-2]
    print(preco)
else:
    print('Não, Nenhum dos candles é vermelho!')


# In[ ]:





# In[ ]:




