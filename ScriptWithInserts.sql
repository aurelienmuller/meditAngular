USE [DBIG3B4]
GO
/****** Object:  Schema [BD]    Script Date: 08/01/2016 23:52:02 ******/
CREATE SCHEMA [BD]
GO
/****** Object:  Table [BD].[Emploi]    Script Date: 08/01/2016 23:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [BD].[Emploi](
	[idEmploi] [int] IDENTITY(1,1) NOT NULL,
	[dateEntree] [date] NOT NULL,
	[dateSortie] [date] NULL,
	[soumis] [char](1) NOT NULL,
	[numeroEntreprise] [numeric](8, 0) NOT NULL,
	[codeProfession] [numeric](8, 0) NOT NULL,
	[idPersonne] [int] NOT NULL,
 CONSTRAINT [ID_Emploi_ID] PRIMARY KEY CLUSTERED 
(
	[idEmploi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [BD].[Entreprise]    Script Date: 08/01/2016 23:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [BD].[Entreprise](
	[numeroEntreprise] [numeric](8, 0) NOT NULL,
	[denomination] [varchar](52) NOT NULL,
	[adresse] [varchar](128) NOT NULL,
	[numtel] [varchar](50) NOT NULL,
	[nbTravailleursSoumis] [numeric](8, 0) NOT NULL,
	[nbTravailleursNonSoumis] [numeric](8, 0) NOT NULL,
 CONSTRAINT [ID_Entreprise_ID] PRIMARY KEY CLUSTERED 
(
	[numeroEntreprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [BD].[Personne]    Script Date: 08/01/2016 23:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [BD].[Personne](
	[idPersonne] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[lastName] [varchar](128) NOT NULL,
	[adresse] [varchar](128) NOT NULL,
	[numTel] [varchar](50) NOT NULL,
	[email] [varchar](52) NOT NULL,
	[numDossier] [numeric](12, 0) NULL,
	[typePersonne] [char](1) NOT NULL,
 CONSTRAINT [ID_Personne_ID] PRIMARY KEY CLUSTERED 
(
	[idPersonne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [BD].[Profession]    Script Date: 08/01/2016 23:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [BD].[Profession](
	[codeProfession] [numeric](8, 0) NOT NULL,
	[description] [varchar](50) NOT NULL DEFAULT (''),
 CONSTRAINT [ID_Profession_ID] PRIMARY KEY CLUSTERED 
(
	[codeProfession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [FKaffectation_IND]    Script Date: 08/01/2016 23:52:02 ******/
CREATE NONCLUSTERED INDEX [FKaffectation_IND] ON [BD].[Emploi]
(
	[idPersonne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKconcerne_IND]    Script Date: 08/01/2016 23:52:02 ******/
CREATE NONCLUSTERED INDEX [FKconcerne_IND] ON [BD].[Emploi]
(
	[codeProfession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKtravail_IND]    Script Date: 08/01/2016 23:52:02 ******/
CREATE NONCLUSTERED INDEX [FKtravail_IND] ON [BD].[Emploi]
(
	[numeroEntreprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Emploi_IND]    Script Date: 08/01/2016 23:52:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Emploi_IND] ON [BD].[Emploi]
(
	[idEmploi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Entreprise_IND]    Script Date: 08/01/2016 23:52:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Entreprise_IND] ON [BD].[Entreprise]
(
	[numeroEntreprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Personne_IND]    Script Date: 08/01/2016 23:52:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Personne_IND] ON [BD].[Personne]
(
	[idPersonne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Unique_mail]    Script Date: 08/01/2016 23:52:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_mail] ON [BD].[Personne]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


CREATE UNIQUE NONCLUSTERED INDEX [Unique_Emploi] ON [BD].[Emploi] 
(
	[idPersonne], [codeProfession], [dateEntree], [numeroEntreprise]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [Unique_numDossier]    Script Date: 08/01/2016 23:52:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_numDossier] ON [BD].[Personne]
(
	[numDossier] ASC
)
WHERE ([numDossier] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Profession_IND]    Script Date: 08/01/2016 23:52:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Profession_IND] ON [BD].[Profession]
(
	[codeProfession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [BD].[Emploi]  WITH CHECK ADD  CONSTRAINT [FKaffectation_FK] FOREIGN KEY([idPersonne])
REFERENCES [BD].[Personne] ([idPersonne])
GO
ALTER TABLE [BD].[Emploi] CHECK CONSTRAINT [FKaffectation_FK]
GO
ALTER TABLE [BD].[Emploi]  WITH CHECK ADD  CONSTRAINT [FKconcerne_FK] FOREIGN KEY([codeProfession])
REFERENCES [BD].[Profession] ([codeProfession])
GO
ALTER TABLE [BD].[Emploi] CHECK CONSTRAINT [FKconcerne_FK]
GO
ALTER TABLE [BD].[Emploi]  WITH CHECK ADD  CONSTRAINT [FKtravail_FK] FOREIGN KEY([numeroEntreprise])
REFERENCES [BD].[Entreprise] ([numeroEntreprise])
GO
ALTER TABLE [BD].[Emploi] CHECK CONSTRAINT [FKtravail_FK]
GO
ALTER TABLE [BD].[Emploi]  WITH CHECK ADD  CONSTRAINT [CK_Emploi_dateSortie] CHECK  (([dateSortie] IS NULL OR [dateSortie] IS NOT NULL AND [dateSortie]>=[dateEntree]))
GO
ALTER TABLE [BD].[Emploi] CHECK CONSTRAINT [CK_Emploi_dateSortie]
GO
ALTER TABLE [BD].[Personne]  WITH CHECK ADD  CONSTRAINT [CK_Personne_numDossier] CHECK  (([numDossier] IS NULL OR [numDossier] IS NOT NULL AND [numDossier]>(0)))
GO
ALTER TABLE [BD].[Personne] CHECK CONSTRAINT [CK_Personne_numDossier]
GO
ALTER TABLE [BD].[Personne]  WITH CHECK ADD  CONSTRAINT [CK_Personne_typePersonne] CHECK  (([typePersonne]='T' OR [typePersonne]='M' OR [typePersonne]='A'))
GO
ALTER TABLE [BD].[Personne] CHECK CONSTRAINT [CK_Personne_typePersonne]
GO

INSERT INTO [BD].[Entreprise] ([numeroEntreprise], [denomination], [adresse], [numtel], [nbTravailleursSoumis], [nbTravailleursNonSoumis]) VALUES (CAST(1 AS Decimal(8, 0)), N'Henallux', N'Rue Joseph Calozet 19, Namur', N'0032123123', CAST(150 AS Decimal(8, 0)), CAST(45 AS Decimal(8, 0)))
INSERT INTO [BD].[Entreprise] ([numeroEntreprise], [denomination], [adresse], [numtel], [nbTravailleursSoumis], [nbTravailleursNonSoumis]) VALUES (CAST(2 AS Decimal(8, 0)), N'Google', N'345 Spear Street, San Fransisco', N'987654321', CAST(6021 AS Decimal(8, 0)), CAST(1200 AS Decimal(8, 0)))
INSERT INTO [BD].[Entreprise] ([numeroEntreprise], [denomination], [adresse], [numtel], [nbTravailleursSoumis], [nbTravailleursNonSoumis]) VALUES (CAST(3 AS Decimal(8, 0)), N'UNamur', N'Rue de Bruxelles, 61 Namur', N'00321594826', CAST(232 AS Decimal(8, 0)), CAST(12 AS Decimal(8, 0)))


SET IDENTITY_INSERT [BD].[Personne] ON
INSERT INTO [BD].[Personne] ([idPersonne], [name], [lastName], [adresse], [numTel], [email], [numDossier], [typePersonne]) VALUES (1, N'Aurélien', N'Muller', N'4 Rue des Prunelles', N'0032123456', N'aur@muller.be', CAST(120 AS Decimal(12, 0)), N'T')
INSERT INTO [BD].[Personne] ([idPersonne], [name], [lastName], [adresse], [numTel], [email], [numDossier], [typePersonne]) VALUES (2, N'Axel', N'Muller', N'4 Rue des Prunelles', N'0032456789', N'axel@muller.be', NULL, N'T')
INSERT INTO [BD].[Personne] ([idPersonne], [name], [lastName], [adresse], [numTel], [email], [numDossier], [typePersonne]) VALUES (5, N'Quentin', N'Miroult', N'4 Rue de Namur', N'0032999666', N'quentinmiroult@mail.be', CAST(10 AS Decimal(12, 0)), N'T')
INSERT INTO [BD].[Personne] ([idPersonne], [name], [lastName], [adresse], [numTel], [email], [numDossier], [typePersonne]) VALUES (9, N'Arnaud', N'Anciaux', N'54 Rue de Charleroi, Namur', N'003245916', N'arnaud@anciaux.be', CAST(457 AS Decimal(12, 0)), N'T')
INSERT INTO [BD].[Personne] ([idPersonne], [name], [lastName], [adresse], [numTel], [email], [numDossier], [typePersonne]) VALUES (17, N'Mahatch', N'Kerimov', N'7 Rue d''Arlon, Namur', N'0032889966', N'mah@tch.com', NULL, N'T')
INSERT INTO [BD].[Personne] ([idPersonne], [name], [lastName], [adresse], [numTel], [email], [numDossier], [typePersonne]) VALUES (18, N'Gaetan', N'Armici', N'5 Rue du coin', N'45786', N'gaetan@armici.be', NULL, N'T')
SET IDENTITY_INSERT [BD].[Personne] OFF


INSERT INTO [BD].[Profession] ([codeProfession], [description]) VALUES (CAST(1 AS Decimal(8, 0)), N'Agent de sécurité')
INSERT INTO [BD].[Profession] ([codeProfession], [description]) VALUES (CAST(2 AS Decimal(8, 0)), N'Programmeur')
INSERT INTO [BD].[Profession] ([codeProfession], [description]) VALUES (CAST(3 AS Decimal(8, 0)), N'Auditeur')
INSERT INTO [BD].[Profession] ([codeProfession], [description]) VALUES (CAST(4 AS Decimal(8, 0)), N'Testeur')