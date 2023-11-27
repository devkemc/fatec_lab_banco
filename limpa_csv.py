"""
Esse script limpa o arquivo CSV original, removendo dados antigos do arquivo.
Deixando com apenas dados de 2017 a 2019.
Autor: Joaquim Kennedy Batista de Souza - 2023
"""

import pandas

CAMINHO_CSV_ORIGINAL = './docker/sql_developer/prouni_2005_2019.csv'
CAMINHO_CSV_LIMPO = './docker/sql_developer/prouni_2017_2019.csv'
COLUNA_ANO = 'ANO_CONCESSAO_BOLSA'
dados_csv = pandas.read_csv(CAMINHO_CSV_ORIGINAL)

dados_csv_limpo = dados_csv[
    dados_csv.apply(
        lambda linha: linha[COLUNA_ANO] > 2016, axis=1
    )
]

dados_csv_limpo.to_csv(CAMINHO_CSV_LIMPO, index=False)
print('CSV limpo com sucesso!')

