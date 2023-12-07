-- Выведите список брендов (Brand), которые продаются в Глобусе (ChainName)
SELECT distinct [Brand],
  [ChainName]
  FROM [BI TEST DB].[dbo].[DIM_Products] as p
JOIN [BI TEST DB].[dbo].[Sales] as s on s.IDSku = p.IDSku
JOIN [BI TEST DB].[dbo].[DIM_Shops] as sh on sh.IDShop = s.IDShop
WHERE [ChainName] = 'Глобус'

-- Посчитайте сумму продаж в гипермаркете METRO (ChainName) за февраль 2021 (Quantity и Amount)
-- в таблице сумма уже отображает продажу нескольких единиц, поэтому переумножать не надо
SELECT SUM([Quantity]) AS TOTAL_QUANTITY, SUM([Amount]) AS TOTAL_SUM, [ChainName]
  FROM [BI TEST DB].[dbo].[Sales] as s
JOIN [BI TEST DB].[dbo].[DIM_Shops] as sh on s.IDShop = sh.IDShop
WHERE [ChainName] = 'METRO' AND [Date] BETWEEN '2021-02-01' AND '2021-02-28'
GROUP BY [ChainName]

--Посчитайте кол-во магазинов Эльдорадо (ChainName), по которым были продажи 12/02/2021
SELECT [Date], COUNT([Quantity]) AS 'Количество магазинов', [ChainName]
  FROM [BI TEST DB].[dbo].[Sales] as s
JOIN [BI TEST DB].[dbo].[DIM_Shops] as sh on s.IDShop = sh.IDShop
WHERE [ChainName] = 'Эльдорадо' AND [Date] = '2021-02-12'
GROUP BY [Date], [ChainName]

--Выведите 5 самых продаваемых товаров (код товара и название) в ДНС (ChainName)
SELECT top 5 p.[IDSku], [SkuName], SUM([Quantity]) AS QUANTITY, [ChainName]
  FROM [BI TEST DB].[dbo].[DIM_Products] as p
JOIN [BI TEST DB].[dbo].[Sales] as s on s.IDSku = p.IDSku
JOIN [BI TEST DB].[dbo].[DIM_Shops] as sh on sh.IDShop = s.IDShop
WHERE [ChainName] = 'ДНС'
GROUP BY [SkuName], [ChainName], p.[IDSku]
ORDER BY SUM([Quantity]) DESC

