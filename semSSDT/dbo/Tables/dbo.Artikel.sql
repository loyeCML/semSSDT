CREATE TABLE [dbo].[Artikel](
	[ArtikelID] [int] IDENTITY(1,1) NOT NULL,
	[Matchcode] [nvarchar](9) NOT NULL,
	[Artikel] [nvarchar](50) NOT NULL,
	[Artikelbeschreibung] [nvarchar](max) NULL,
	[ArtikelgruppeID] [int] NOT NULL,
	[Verkaufspreis] [money] NULL,
	KontaktID [int] NULL,
	[Einkaufspreis] [money] NULL,
	[Groesse] [nvarchar](5) NULL,
	[Farbe] [nvarchar](10) NULL,
	[Inaktiv] [bit] NOT NULL,
	[iTS] [timestamp] NOT NULL,
 CONSTRAINT [CIX__dbo_Artikel_ArtikelID] PRIMARY KEY CLUSTERED 
(
	[ArtikelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Artikel_Artikel]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Artikel_Artikel] ON [dbo].[Artikel]
(
	[Artikel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Artikel_ArtikelgruppeID]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Artikel_ArtikelgruppeID] ON [dbo].[Artikel]
(
	[ArtikelgruppeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Artikel_LieferantenNr]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Artikel_LieferantenNr] ON [dbo].[Artikel]
(
	KontaktID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX_UQ__dbo_Artikel_Matchcode]    Script Date: 27.10.2014 14:24:58 ******/
ALTER TABLE [dbo].[Artikel] ADD  CONSTRAINT [IX_UQ__dbo_Artikel_Matchcode] UNIQUE NONCLUSTERED 
(
	[Matchcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artikel] ADD  CONSTRAINT [Default__dbo_Artikel_Inaktiv_0]  DEFAULT ((0)) FOR [Inaktiv]
GO
ALTER TABLE [dbo].[Artikel]  ADD  CONSTRAINT [FK__dbo_Artikel__dbo_Kontakte_KontaktID_LieferantenNr] FOREIGN KEY(KontaktID)
REFERENCES [dbo].[Kontakte] ([KontaktID])
GO

ALTER TABLE [dbo].[Artikel] CHECK CONSTRAINT [FK__dbo_Artikel__dbo_Kontakte_KontaktID_LieferantenNr]
GO
ALTER TABLE [dbo].[Artikel]  ADD  CONSTRAINT [FK__dbo_Artikel__dbo_Artikelgruppen_ArtikelgruppeID] FOREIGN KEY([ArtikelgruppeID])
REFERENCES [dbo].[Artikelgruppen] ([ArtikelgruppeID])
GO

ALTER TABLE [dbo].[Artikel] CHECK CONSTRAINT [FK__dbo_Artikel__dbo_Artikelgruppen_ArtikelgruppeID]