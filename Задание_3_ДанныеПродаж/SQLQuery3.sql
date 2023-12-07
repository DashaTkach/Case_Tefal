-- �������� ������ ������� (Brand), ������� ��������� � ������� (ChainName)
SELECT distinct [Brand],
  [ChainName]
  FROM [BI TEST DB].[dbo].[DIM_Products] as p
JOIN [BI TEST DB].[dbo].[Sales] as s on s.IDSku = p.IDSku
JOIN [BI TEST DB].[dbo].[DIM_Shops] as sh on sh.IDShop = s.IDShop
WHERE [ChainName] = '������'

-- ���������� ����� ������ � ������������ METRO (ChainName) �� ������� 2021 (Quantity � Amount)
-- � ������� ����� ��� ���������� ������� ���������� ������, ������� ������������ �� ����
SELECT SUM([Quantity]) AS TOTAL_QUANTITY, SUM([Amount]) AS TOTAL_SUM, [ChainName]
  FROM [BI TEST DB].[dbo].[Sales] as s
JOIN [BI TEST DB].[dbo].[DIM_Shops] as sh on s.IDShop = sh.IDShop
WHERE [ChainName] = 'METRO' AND [Date] BETWEEN '2021-02-01' AND '2021-02-28'
GROUP BY [ChainName]

--���������� ���-�� ��������� ��������� (ChainName), �� ������� ���� ������� 12/02/2021
SELECT [Date], COUNT([Quantity]) AS '���������� ���������', [ChainName]
  FROM [BI TEST DB].[dbo].[Sales] as s
JOIN [BI TEST DB].[dbo].[DIM_Shops] as sh on s.IDShop = sh.IDShop
WHERE [ChainName] = '���������' AND [Date] = '2021-02-12'
GROUP BY [Date], [ChainName]

--�������� 5 ����� ����������� ������� (��� ������ � ��������) � ��� (ChainName)
SELECT top 5 p.[IDSku], [SkuName], SUM([Quantity]) AS QUANTITY, [ChainName]
  FROM [BI TEST DB].[dbo].[DIM_Products] as p
JOIN [BI TEST DB].[dbo].[Sales] as s on s.IDSku = p.IDSku
JOIN [BI TEST DB].[dbo].[DIM_Shops] as sh on sh.IDShop = s.IDShop
WHERE [ChainName] = '���'
GROUP BY [SkuName], [ChainName], p.[IDSku]
ORDER BY SUM([Quantity]) DESC

