CREATE TABLE [prod].[Produkte](
	[ProduktID] [int] IDENTITY(1,1) NOT NULL,
	[Produkt] [nvarchar](50) NOT NULL,
	[ProduktBeschreibung] [nvarchar](max) NULL,
	[Herstellungskosten] [money] NULL,
	[ProduktgruppeID] [int] NULL,
	[ImVerkauf] [bit] NULL,
	[LetzteAenderungVon] [nvarchar](256) NULL,
	[LetzteAenderungAm] [datetime] NULL,
 CONSTRAINT [CIX_PK__prod_Produkte_ProduktID] PRIMARY KEY CLUSTERED 
(
	[ProduktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [prod].[Produkte] ADD  CONSTRAINT [Default__prod_Produkte_ImVerkauf_0]  DEFAULT ((0)) FOR [ImVerkauf]
GO
ALTER TABLE [prod].[Produkte]  ADD  CONSTRAINT [Check__prod_Produkte_Herstellungskosten_groesser_0] CHECK  (([Herstellungskosten]>(0)))
GO

ALTER TABLE [prod].[Produkte] CHECK CONSTRAINT [Check__prod_Produkte_Herstellungskosten_groesser_0]
GO
/****** Object:  Index [IX_UQ__prod_Produkte_Produkt_ProduktgruppeID]    Script Date: 24.06.2016 10:46:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UQ__prod_Produkte_Produkt_ProduktgruppeID] ON [prod].[Produkte]
(
	[Produkt] ASC,
	[ProduktgruppeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]