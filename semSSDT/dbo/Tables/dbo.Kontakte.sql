CREATE TABLE [dbo].[Kontakte](
	[KontaktID] [int] IDENTITY(1,1) NOT NULL,
	[Kontaktart] [char](1) NOT NULL,
	[Firma] [nvarchar](255) NOT NULL,
	[Namenszusatz] [nvarchar](255) NULL,
	[Strasse] [nvarchar](60) NOT NULL,
	[Ort] [nvarchar](100) NOT NULL,
	[Region] [nvarchar](50) NULL,
	[PLZ] [nvarchar](8) NOT NULL,
	[Staat] [nvarchar](50) NULL,
	[Telefon] [nvarchar](25) NULL,
	[Telefax] [nvarchar](25) NULL,
	[Email] [nvarchar](100) NULL,
	[iTS] [timestamp] NOT NULL,
 CONSTRAINT [CIX__dbo_Kontakte_KontaktID] PRIMARY KEY CLUSTERED 
(
	[KontaktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Kontakte_Firma]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Kontakte_Firma] ON [dbo].[Kontakte]
(
	[Firma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Kontakte_Kontaktart]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Kontakte_Kontaktart] ON [dbo].[Kontakte]
(
	[Kontaktart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX_UQ__dbo_Kontakte_Kontaktart_Firma]    Script Date: 27.10.2014 14:24:58 ******/
ALTER TABLE [dbo].[Kontakte] ADD  CONSTRAINT [IX_UQ__dbo_Kontakte_Kontaktart_Firma] UNIQUE NONCLUSTERED 
(
	[KontaktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]