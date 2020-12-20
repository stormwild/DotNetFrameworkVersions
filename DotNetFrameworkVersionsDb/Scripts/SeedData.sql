USE [DotNetFrameworkVersionsDb]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[SeedDataProc]

SELECT	@return_value as 'Return Value'

GO
