CREATE PROCEDURE [dbo].[SeedDataProc]
AS
    SET IDENTITY_INSERT [dbo].[DotNetFrameworkVersions] ON
    
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    BEGIN TRAN
        
        IF NOT EXISTS ( SELECT Id FROM dbo.DotNetFrameworkVersions WITH (UPDLOCK) WHERE Id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) )
            
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (1, N'378389', N'All', N'4.5', NULL)
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (2, N'378675', N'All', N'4.5.1', N'.NET Framework 4.5.1 installed with Windows 8.1 or Windows Server 2012 R2')
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (3, N'378758', N'All', N'4.5.1', N'.NET Framework 4.5.1 installed on Windows 8, Windows 7 SP1, or Windows Vista SP2')
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (4, N'379893', N'All', N'4.5.2', N'.NET Framework 4.5.2')
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (5, N'393297', N'Others', N'4.6', NULL)
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (6, N'393273', N'Windows10', N'4.6', NULL)
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (9, N'394271', N'Others', N'4.6.1', NULL)
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (10, N'394254', N'Windows10', N'4.6.1', N'November Update')
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (11, N'394806', N'Others', N'4.6.2', NULL)
            INSERT INTO [dbo].[DotNetFrameworkVersions] ([Id], [ReleaseDWORD], [WindowsVersion], [FrameworkVersion], [Description]) VALUES (13, N'394802', N'Windows10', N'4.6.2', N'Windows 10 Anniversary Update')

    COMMIT
    
    SET IDENTITY_INSERT [dbo].[DotNetFrameworkVersions] OFF
