IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330150314_initial create')
BEGIN
    CREATE TABLE [Categories] (
        [CategoryId] int NOT NULL IDENTITY,
        [Title] nvarchar(50) NOT NULL,
        [Icon] nvarchar(5) NOT NULL,
        [Type] nvarchar(10) NOT NULL,
        CONSTRAINT [PK_Categories] PRIMARY KEY ([CategoryId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330150314_initial create')
BEGIN
    CREATE TABLE [Transactions] (
        [TransactionId] int NOT NULL IDENTITY,
        [CategoryId] int NOT NULL,
        [Amount] int NOT NULL,
        [Note] nvarchar(75) NULL,
        [Date] datetime2 NOT NULL,
        CONSTRAINT [PK_Transactions] PRIMARY KEY ([TransactionId]),
        CONSTRAINT [FK_Transactions_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([CategoryId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330150314_initial create')
BEGIN
    CREATE INDEX [IX_Transactions_CategoryId] ON [Transactions] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330150314_initial create')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230330150314_initial create', N'7.0.4');
END;
GO

COMMIT;
GO

