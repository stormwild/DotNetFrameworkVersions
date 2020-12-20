CREATE TABLE [dbo].[DotNetFrameworkVersions] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [ReleaseDWORD]     NVARCHAR (50)  NOT NULL,
    [WindowsVersion]   NVARCHAR (50)  NOT NULL,
    [FrameworkVersion] NVARCHAR (50)  NOT NULL,
    [Description]      NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

