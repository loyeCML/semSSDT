CREATE TABLE [dbo].[Ansprechpartner](
	[AnsprechpartnerID] [int] IDENTITY(1,1) NOT NULL,
	[KontaktID] [int] NOT NULL,
	[Nachname] [nvarchar](100) NOT NULL,
	[Vorname] [nvarchar](20) NULL,
	[Anrede] [nvarchar](5) NULL,
	[Position] [nvarchar](100) NULL,
	[Telefon] [nvarchar](25) NULL,
	[Mobil] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[Telefax] [nvarchar](25) NULL,
	[iTS] [timestamp] NOT NULL,
 CONSTRAINT [CIX__dbo_Ansprechpartner_AnsprechpartnerID] PRIMARY KEY CLUSTERED 
(
	[AnsprechpartnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Ansprechpartner_Email]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Ansprechpartner_Email] ON [dbo].[Ansprechpartner]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Ansprechpartner_KontaktID]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Ansprechpartner_KontaktID] ON [dbo].[Ansprechpartner]
(
	[KontaktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Ansprechpartner_Nachname]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Ansprechpartner_Nachname] ON [dbo].[Ansprechpartner]
(
	[Nachname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
-- ########################################################
--
-- Datenintegrität und Indexe
-- 
-- ########################################################

/****** Object:  Index [IX_UQ__dbo_Ansprechpartner_KontaktID_Email]    Script Date: 27.10.2014 14:24:58 ******/
ALTER TABLE [dbo].[Ansprechpartner] ADD  CONSTRAINT [IX_UQ__dbo_Ansprechpartner_KontaktID_Email] UNIQUE NONCLUSTERED 
(
	[AnsprechpartnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ansprechpartner]  ADD  CONSTRAINT [FK__dbo_Ansprechpartner__dbo_Kontakte_KontaktID] FOREIGN KEY([KontaktID])
REFERENCES [dbo].[Kontakte] ([KontaktID])
GO

ALTER TABLE [dbo].[Ansprechpartner] CHECK CONSTRAINT [FK__dbo_Ansprechpartner__dbo_Kontakte_KontaktID]