import pandas as pd

df_data = pd.read_csv('horror_movies.csv')

# Проверить данные на наличие пустых значений. В случае их наличия удалить данные строки
# print(df_data.isnull()) - проверяем данные на наличие пустых значений
clean_data = df_data.dropna(axis=0, how='any')
# print(data)

# Отфильтровать данные чтобы в выборке остались только четные id и статус фильма был "Released".
data = clean_data.loc[df_data['id'] % 2 == 0]
data = clean_data.loc[df_data['status'] == 'Released']
# print(data)

# Вывести сумму доходов (revenue) для каждого жанра (genre_names).
filter_data = clean_data.groupby(['genre_names'])['revenue'].sum().reset_index()
# print(filter_data)

# Для каждого жанра посчитать отношение оценки (vote_average) и бюджета (budget). Использовать средние значения.
