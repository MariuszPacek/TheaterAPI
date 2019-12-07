
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/07/2019 16:17:54
-- Generated from EDMX file: C:\Users\Mariusz\source\repos\MariuszPacek\TheaterAPI\Theater\Database\TheaterDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Theather];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'DramaSet'
CREATE TABLE [dbo].[DramaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AuthorSet'
CREATE TABLE [dbo].[AuthorSet] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'SceneSet'
CREATE TABLE [dbo].[SceneSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DramaId] int  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Number] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PersonSet'
CREATE TABLE [dbo].[PersonSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SceneId] int  NOT NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SituationSet'
CREATE TABLE [dbo].[SituationSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [SceneId] int  NOT NULL
);
GO

-- Creating table 'PlaceSet'
CREATE TABLE [dbo].[PlaceSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SceneId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DramaAuthor'
CREATE TABLE [dbo].[DramaAuthor] (
    [Drama_Id] int  NOT NULL,
    [Author_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'DramaSet'
ALTER TABLE [dbo].[DramaSet]
ADD CONSTRAINT [PK_DramaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AuthorSet'
ALTER TABLE [dbo].[AuthorSet]
ADD CONSTRAINT [PK_AuthorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SceneSet'
ALTER TABLE [dbo].[SceneSet]
ADD CONSTRAINT [PK_SceneSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PersonSet'
ALTER TABLE [dbo].[PersonSet]
ADD CONSTRAINT [PK_PersonSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SituationSet'
ALTER TABLE [dbo].[SituationSet]
ADD CONSTRAINT [PK_SituationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PlaceSet'
ALTER TABLE [dbo].[PlaceSet]
ADD CONSTRAINT [PK_PlaceSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Drama_Id], [Author_Id] in table 'DramaAuthor'
ALTER TABLE [dbo].[DramaAuthor]
ADD CONSTRAINT [PK_DramaAuthor]
    PRIMARY KEY CLUSTERED ([Drama_Id], [Author_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Drama_Id] in table 'DramaAuthor'
ALTER TABLE [dbo].[DramaAuthor]
ADD CONSTRAINT [FK_DramaAuthor_Drama]
    FOREIGN KEY ([Drama_Id])
    REFERENCES [dbo].[DramaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Author_Id] in table 'DramaAuthor'
ALTER TABLE [dbo].[DramaAuthor]
ADD CONSTRAINT [FK_DramaAuthor_Author]
    FOREIGN KEY ([Author_Id])
    REFERENCES [dbo].[AuthorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DramaAuthor_Author'
CREATE INDEX [IX_FK_DramaAuthor_Author]
ON [dbo].[DramaAuthor]
    ([Author_Id]);
GO

-- Creating foreign key on [DramaId] in table 'SceneSet'
ALTER TABLE [dbo].[SceneSet]
ADD CONSTRAINT [FK_DramaScene]
    FOREIGN KEY ([DramaId])
    REFERENCES [dbo].[DramaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DramaScene'
CREATE INDEX [IX_FK_DramaScene]
ON [dbo].[SceneSet]
    ([DramaId]);
GO

-- Creating foreign key on [SceneId] in table 'PersonSet'
ALTER TABLE [dbo].[PersonSet]
ADD CONSTRAINT [FK_ScenePerson]
    FOREIGN KEY ([SceneId])
    REFERENCES [dbo].[SceneSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ScenePerson'
CREATE INDEX [IX_FK_ScenePerson]
ON [dbo].[PersonSet]
    ([SceneId]);
GO

-- Creating foreign key on [SceneId] in table 'SituationSet'
ALTER TABLE [dbo].[SituationSet]
ADD CONSTRAINT [FK_SceneSituation]
    FOREIGN KEY ([SceneId])
    REFERENCES [dbo].[SceneSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SceneSituation'
CREATE INDEX [IX_FK_SceneSituation]
ON [dbo].[SituationSet]
    ([SceneId]);
GO

-- Creating foreign key on [SceneId] in table 'PlaceSet'
ALTER TABLE [dbo].[PlaceSet]
ADD CONSTRAINT [FK_ScenePlace]
    FOREIGN KEY ([SceneId])
    REFERENCES [dbo].[SceneSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ScenePlace'
CREATE INDEX [IX_FK_ScenePlace]
ON [dbo].[PlaceSet]
    ([SceneId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------