import requests
import pandas as pd
from datetime import date


def currency(url, title):
    html = requests.get(url).content
    df_list = pd.read_html(html, encoding='windows-1251')
    df = df_list[-1]
    df = df[['Доллар США USD', 'ЕВРО EUR']].head(7)
    df.to_json(f'{title}.json')


if __name__ == '__main__':
    url = 'https://www.audit-it.ru/currency/print_curs.php?currencyTable=USD,EUR,' \
          'GBP&monthStart=8&yearStart=2023&monthEnd=11&yearEnd=2023&currency=USD'
    title = date.today()
    currency(url, title)
