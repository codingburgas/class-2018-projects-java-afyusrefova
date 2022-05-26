/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [elder_id]
      ,[dateOfBirth]
      ,[first_name]
      ,[last_name]
  FROM [nursingHome].[dbo].[Elders]