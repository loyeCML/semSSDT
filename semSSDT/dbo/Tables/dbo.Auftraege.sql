CREATE TABLE [dbo].[Auftraege](
	[AuftragID] [int] IDENTITY(1,1) NOT NULL,
	[KontaktID] [int] NOT NULL,
	[PersonalID] [int] NOT NULL,
	[Auftragsdatum] [datetime2](0) NOT NULL,
	[iTS] [timestamp] NOT NULL,
 CONSTRAINT [CIX__dbo_Auftraege_AuftragID] PRIMARY KEY CLUSTERED 
(
	[AuftragID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Auftraege_Auftragsdatum]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Auftraege_Auftragsdatum] ON [dbo].[Auftraege]
(
	[Auftragsdatum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Auftraege_KontaktID]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Auftraege_KontaktID] ON [dbo].[Auftraege]
(
	[KontaktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Auftraege_PersonalID]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Auftraege_PersonalID] ON [dbo].[Auftraege]
(
	[PersonalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
ALTER TABLE [dbo].[Auftraege]  ADD  CONSTRAINT [FK__dho_Auftraege__dbo_Kontakte_KontaktID] FOREIGN KEY([KontaktID])
REFERENCES [dbo].[Kontakte] ([KontaktID])
GO

ALTER TABLE [dbo].[Auftraege] CHECK CONSTRAINT [FK__dho_Auftraege__dbo_Kontakte_KontaktID]
GO
ALTER TABLE [dbo].[Auftraege]  ADD  CONSTRAINT [FK__dbo_Auftraege__dbo_Personal_PersonalID] FOREIGN KEY([PersonalID])
REFERENCES [dbo].[Personal] ([PersonalID])
GO

ALTER TABLE [dbo].[Auftraege] CHECK CONSTRAINT [FK__dbo_Auftraege__dbo_Personal_PersonalID]