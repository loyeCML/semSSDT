CREATE TABLE [dbo].[Auftragspositionen](
	[AuftragspositionID] [int] IDENTITY(1,1) NOT NULL,
	[AuftragID] [int] NOT NULL,
	[ArtikelID] [int] NOT NULL,
	[PosNr] [int] NOT NULL,
	[Einzelpreis] [money] NOT NULL,
	[Menge] [smallint] NOT NULL,
	[iTS] [timestamp] NOT NULL,
 CONSTRAINT [CIX__dbo_Auftragspositionen_AuftragspositionID] PRIMARY KEY CLUSTERED 
(
	[AuftragspositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Auftragspositionen_ArtikelID]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Auftragspositionen_ArtikelID] ON [dbo].[Auftragspositionen]
(
	[ArtikelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Auftragspositionen_AuftragID]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Auftragspositionen_AuftragID] ON [dbo].[Auftragspositionen]
(
	[AuftragID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
ALTER TABLE [dbo].[Auftragspositionen]  ADD  CONSTRAINT [Check__dbo_Auftragspositionen_Menge_groesser_0] CHECK  (([Menge]>(0)))
GO

ALTER TABLE [dbo].[Auftragspositionen] CHECK CONSTRAINT [Check__dbo_Auftragspositionen_Menge_groesser_0]
GO
ALTER TABLE [dbo].[Auftragspositionen]  ADD  CONSTRAINT [Check__dbo_Auftragspositionen_Einzelpreis_groesser_0] CHECK  (([Einzelpreis]>(0)))
GO

ALTER TABLE [dbo].[Auftragspositionen] CHECK CONSTRAINT [Check__dbo_Auftragspositionen_Einzelpreis_groesser_0]
GO
ALTER TABLE [dbo].[Auftragspositionen]  ADD  CONSTRAINT [FK__dbo_Auftragspositionen__dbo_Auftraege_AuftragID] FOREIGN KEY([AuftragID])
REFERENCES [dbo].[Auftraege] ([AuftragID])
GO

ALTER TABLE [dbo].[Auftragspositionen] CHECK CONSTRAINT [FK__dbo_Auftragspositionen__dbo_Auftraege_AuftragID]
GO
ALTER TABLE [dbo].[Auftragspositionen]  ADD  CONSTRAINT [FK__dbo_Auftragspositionen__dbo_Artikel_ArtikelID] FOREIGN KEY([ArtikelID])
REFERENCES [dbo].[Artikel] ([ArtikelID])
GO

ALTER TABLE [dbo].[Auftragspositionen] CHECK CONSTRAINT [FK__dbo_Auftragspositionen__dbo_Artikel_ArtikelID]