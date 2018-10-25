CREATE TABLE [dbo].[Artikelgruppen](
	[ArtikelgruppeID] [int] IDENTITY(1,1) NOT NULL,
	[Artikelgruppe] [nvarchar](50) NOT NULL,
	[AgBeschreibung] [nvarchar](max) NULL,
	[iTS] [timestamp] NOT NULL,
 CONSTRAINT [CIX__dbo_Artikelgruppen_ArtikelgruppeID] PRIMARY KEY CLUSTERED 
(
	[ArtikelgruppeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
/****** Object:  Index [IX_UQ__dbo_Artikelgruppen_Artikelgruppe]    Script Date: 27.10.2014 14:24:58 ******/
ALTER TABLE [dbo].[Artikelgruppen] ADD  CONSTRAINT [IX_UQ__dbo_Artikelgruppen_Artikelgruppe] UNIQUE NONCLUSTERED 
(
	[Artikelgruppe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]