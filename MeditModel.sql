
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/25/2015 18:47:08
-- Generated from EDMX file: \\mac\Home\Desktop\ProjetBD2\ProjetBD\ProjetBD\Models\MeditModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DBIG3B4];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[BD].[FK_FKaffectation_FK]', 'F') IS NOT NULL
    ALTER TABLE [BD].[Emploi] DROP CONSTRAINT [FK_FKaffectation_FK];
GO
IF OBJECT_ID(N'[BD].[FK_FKconcerne_FK]', 'F') IS NOT NULL
    ALTER TABLE [BD].[Emploi] DROP CONSTRAINT [FK_FKconcerne_FK];
GO
IF OBJECT_ID(N'[BD].[FK_FKint_Ent]', 'F') IS NOT NULL
    ALTER TABLE [BD].[interlocuteur] DROP CONSTRAINT [FK_FKint_Ent];
GO
IF OBJECT_ID(N'[BD].[FK_FKint_Per_FK]', 'F') IS NOT NULL
    ALTER TABLE [BD].[interlocuteur] DROP CONSTRAINT [FK_FKint_Per_FK];
GO
IF OBJECT_ID(N'[BD].[FK_FKtra_Lan_FK]', 'F') IS NOT NULL
    ALTER TABLE [BD].[tradTravail] DROP CONSTRAINT [FK_FKtra_Lan_FK];
GO
IF OBJECT_ID(N'[BD].[FK_FKtra_Pro_FK]', 'F') IS NOT NULL
    ALTER TABLE [BD].[tradTravail] DROP CONSTRAINT [FK_FKtra_Pro_FK];
GO
IF OBJECT_ID(N'[BD].[FK_FKtravail_FK]', 'F') IS NOT NULL
    ALTER TABLE [BD].[Emploi] DROP CONSTRAINT [FK_FKtravail_FK];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[BD].[Emploi]', 'U') IS NOT NULL
    DROP TABLE [BD].[Emploi];
GO
IF OBJECT_ID(N'[BD].[Entreprise]', 'U') IS NOT NULL
    DROP TABLE [BD].[Entreprise];
GO
IF OBJECT_ID(N'[BD].[EquipeMed]', 'U') IS NOT NULL
    DROP TABLE [BD].[EquipeMed];
GO
IF OBJECT_ID(N'[BD].[interlocuteur]', 'U') IS NOT NULL
    DROP TABLE [BD].[interlocuteur];
GO
IF OBJECT_ID(N'[BD].[Langues]', 'U') IS NOT NULL
    DROP TABLE [BD].[Langues];
GO
IF OBJECT_ID(N'[BD].[Lieu]', 'U') IS NOT NULL
    DROP TABLE [BD].[Lieu];
GO
IF OBJECT_ID(N'[BD].[Personne]', 'U') IS NOT NULL
    DROP TABLE [BD].[Personne];
GO
IF OBJECT_ID(N'[BD].[Profession]', 'U') IS NOT NULL
    DROP TABLE [BD].[Profession];
GO
IF OBJECT_ID(N'[BD].[Secteur]', 'U') IS NOT NULL
    DROP TABLE [BD].[Secteur];
GO
IF OBJECT_ID(N'[BD].[tradTravail]', 'U') IS NOT NULL
    DROP TABLE [BD].[tradTravail];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Entreprises'
CREATE TABLE [dbo].[Entreprises] (
    [numeroEntreprise] decimal(8,0)  NOT NULL,
    [denomination] varchar(52)  NOT NULL,
    [adresse] varchar(128)  NOT NULL,
    [numtel] varchar(50)  NOT NULL,
    [nbTravailleursSoumis] decimal(8,0)  NOT NULL,
    [nbTravailleursNonSoumis] decimal(8,0)  NOT NULL
);
GO

-- Creating table 'EquipeMeds'
CREATE TABLE [dbo].[EquipeMeds] (
    [idEquipe] decimal(8,0)  NOT NULL,
    [idAssistante1] varchar(8)  NOT NULL,
    [idAssistante2] varchar(8)  NULL,
    [idLieu1] decimal(8,0)  NOT NULL,
    [idLieu2] decimal(8,0)  NOT NULL,
    [idLieu3] decimal(8,0)  NOT NULL
);
GO

-- Creating table 'Langues'
CREATE TABLE [dbo].[Langues] (
    [codeLangue] decimal(8,0)  NOT NULL,
    [libelle] varchar(128)  NOT NULL
);
GO

-- Creating table 'Lieux'
CREATE TABLE [dbo].[Lieux] (
    [idLieu] decimal(8,0)  NOT NULL,
    [type] char(1)  NOT NULL,
    [supplement] decimal(4,2)  NOT NULL
);
GO

-- Creating table 'Personnes'
CREATE TABLE [dbo].[Personnes] (
    [idPersonne] decimal(8,0)  NOT NULL,
    [name] varchar(128)  NOT NULL,
    [lastName] varchar(128)  NOT NULL,
    [adresse] varchar(128)  NOT NULL,
    [numTel] varchar(50)  NOT NULL,
    [email] varchar(52)  NOT NULL,
    [numDossier] decimal(12,0)  NULL,
    [typePersonne] char(1)  NOT NULL
);
GO

-- Creating table 'Professions'
CREATE TABLE [dbo].[Professions] (
    [codeProfession] decimal(8,0)  NOT NULL
);
GO

-- Creating table 'Secteurs'
CREATE TABLE [dbo].[Secteurs] (
    [codeSecteur] decimal(8,0)  NOT NULL,
    [denom] char(128)  NOT NULL
);
GO

-- Creating table 'tradTravails'
CREATE TABLE [dbo].[tradTravails] (
    [idTradTravail] decimal(1,0)  NOT NULL,
    [traduction] varchar(50)  NOT NULL,
    [codeProfession] decimal(8,0)  NOT NULL,
    [codeLangue] decimal(8,0)  NOT NULL
);
GO

-- Creating table 'Emplois'
CREATE TABLE [dbo].[Emplois] (
    [idEmploi] int IDENTITY(1,1) NOT NULL,
    [dateEntree] datetime  NOT NULL,
    [dateSortie] datetime  NULL,
    [soumis] char(1)  NOT NULL,
    [numeroEntreprise] decimal(8,0)  NOT NULL,
    [codeProfession] decimal(8,0)  NOT NULL,
    [idPersonne] decimal(8,0)  NOT NULL
);
GO

-- Creating table 'interlocuteur'
CREATE TABLE [dbo].[interlocuteur] (
    [Entreprises_numeroEntreprise] decimal(8,0)  NOT NULL,
    [Personnes_idPersonne] decimal(8,0)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [numeroEntreprise] in table 'Entreprises'
ALTER TABLE [dbo].[Entreprises]
ADD CONSTRAINT [PK_Entreprises]
    PRIMARY KEY CLUSTERED ([numeroEntreprise] ASC);
GO

-- Creating primary key on [idEquipe] in table 'EquipeMeds'
ALTER TABLE [dbo].[EquipeMeds]
ADD CONSTRAINT [PK_EquipeMeds]
    PRIMARY KEY CLUSTERED ([idEquipe] ASC);
GO

-- Creating primary key on [codeLangue] in table 'Langues'
ALTER TABLE [dbo].[Langues]
ADD CONSTRAINT [PK_Langues]
    PRIMARY KEY CLUSTERED ([codeLangue] ASC);
GO

-- Creating primary key on [idLieu] in table 'Lieux'
ALTER TABLE [dbo].[Lieux]
ADD CONSTRAINT [PK_Lieux]
    PRIMARY KEY CLUSTERED ([idLieu] ASC);
GO

-- Creating primary key on [idPersonne] in table 'Personnes'
ALTER TABLE [dbo].[Personnes]
ADD CONSTRAINT [PK_Personnes]
    PRIMARY KEY CLUSTERED ([idPersonne] ASC);
GO

-- Creating primary key on [codeProfession] in table 'Professions'
ALTER TABLE [dbo].[Professions]
ADD CONSTRAINT [PK_Professions]
    PRIMARY KEY CLUSTERED ([codeProfession] ASC);
GO

-- Creating primary key on [codeSecteur] in table 'Secteurs'
ALTER TABLE [dbo].[Secteurs]
ADD CONSTRAINT [PK_Secteurs]
    PRIMARY KEY CLUSTERED ([codeSecteur] ASC);
GO

-- Creating primary key on [idTradTravail] in table 'tradTravails'
ALTER TABLE [dbo].[tradTravails]
ADD CONSTRAINT [PK_tradTravails]
    PRIMARY KEY CLUSTERED ([idTradTravail] ASC);
GO

-- Creating primary key on [idEmploi] in table 'Emplois'
ALTER TABLE [dbo].[Emplois]
ADD CONSTRAINT [PK_Emplois]
    PRIMARY KEY CLUSTERED ([idEmploi] ASC);
GO

-- Creating primary key on [Entreprises_numeroEntreprise], [Personnes_idPersonne] in table 'interlocuteur'
ALTER TABLE [dbo].[interlocuteur]
ADD CONSTRAINT [PK_interlocuteur]
    PRIMARY KEY CLUSTERED ([Entreprises_numeroEntreprise], [Personnes_idPersonne] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [codeLangue] in table 'tradTravails'
ALTER TABLE [dbo].[tradTravails]
ADD CONSTRAINT [FK_FKtra_Lan_FK]
    FOREIGN KEY ([codeLangue])
    REFERENCES [dbo].[Langues]
        ([codeLangue])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKtra_Lan_FK'
CREATE INDEX [IX_FK_FKtra_Lan_FK]
ON [dbo].[tradTravails]
    ([codeLangue]);
GO

-- Creating foreign key on [codeProfession] in table 'tradTravails'
ALTER TABLE [dbo].[tradTravails]
ADD CONSTRAINT [FK_FKtra_Pro_FK]
    FOREIGN KEY ([codeProfession])
    REFERENCES [dbo].[Professions]
        ([codeProfession])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKtra_Pro_FK'
CREATE INDEX [IX_FK_FKtra_Pro_FK]
ON [dbo].[tradTravails]
    ([codeProfession]);
GO

-- Creating foreign key on [Entreprises_numeroEntreprise] in table 'interlocuteur'
ALTER TABLE [dbo].[interlocuteur]
ADD CONSTRAINT [FK_interlocuteur_Entreprise]
    FOREIGN KEY ([Entreprises_numeroEntreprise])
    REFERENCES [dbo].[Entreprises]
        ([numeroEntreprise])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Personnes_idPersonne] in table 'interlocuteur'
ALTER TABLE [dbo].[interlocuteur]
ADD CONSTRAINT [FK_interlocuteur_Personne]
    FOREIGN KEY ([Personnes_idPersonne])
    REFERENCES [dbo].[Personnes]
        ([idPersonne])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_interlocuteur_Personne'
CREATE INDEX [IX_FK_interlocuteur_Personne]
ON [dbo].[interlocuteur]
    ([Personnes_idPersonne]);
GO

-- Creating foreign key on [idPersonne] in table 'Emplois'
ALTER TABLE [dbo].[Emplois]
ADD CONSTRAINT [FK_FKaffectation_FK]
    FOREIGN KEY ([idPersonne])
    REFERENCES [dbo].[Personnes]
        ([idPersonne])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKaffectation_FK'
CREATE INDEX [IX_FK_FKaffectation_FK]
ON [dbo].[Emplois]
    ([idPersonne]);
GO

-- Creating foreign key on [codeProfession] in table 'Emplois'
ALTER TABLE [dbo].[Emplois]
ADD CONSTRAINT [FK_FKconcerne_FK]
    FOREIGN KEY ([codeProfession])
    REFERENCES [dbo].[Professions]
        ([codeProfession])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKconcerne_FK'
CREATE INDEX [IX_FK_FKconcerne_FK]
ON [dbo].[Emplois]
    ([codeProfession]);
GO

-- Creating foreign key on [numeroEntreprise] in table 'Emplois'
ALTER TABLE [dbo].[Emplois]
ADD CONSTRAINT [FK_FKtravail_FK]
    FOREIGN KEY ([numeroEntreprise])
    REFERENCES [dbo].[Entreprises]
        ([numeroEntreprise])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKtravail_FK'
CREATE INDEX [IX_FK_FKtravail_FK]
ON [dbo].[Emplois]
    ([numeroEntreprise]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------