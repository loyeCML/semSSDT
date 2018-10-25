CREATE TABLE [dbo].[Personal](
	[PersonalID] [int] IDENTITY(1,1) NOT NULL,
	[Nachname] [nvarchar](20) NOT NULL,
	[Vorname] [nvarchar](10) NOT NULL,
	[Position] [nvarchar](30) NULL,
	[Anrede] [nvarchar](25) NOT NULL,
	[Geburtsdatum] [datetime2](0) NULL,
	[Einstellung] [datetime2](0) NOT NULL,
	[Durchwahl] [nvarchar](4) NULL,
	[Mobil] [nvarchar](4) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Foto] [nvarchar](255) NULL,
	[Bemerkungen] [nvarchar](max) NULL,
	[Vorgesetzter] [int] NULL,
	[iTS] [timestamp] NOT NULL,
 CONSTRAINT [CIX__dbo_Personal_PersonalID] PRIMARY KEY CLUSTERED 
(
	[PersonalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Personal_Nachname]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Personal_Nachname] ON [dbo].[Personal]
(
	[Nachname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
/****** Object:  Index [IX__dbo_Personal_Vorgesetzter]    Script Date: 27.10.2014 14:24:58 ******/
CREATE NONCLUSTERED INDEX [IX__dbo_Personal_Vorgesetzter] ON [dbo].[Personal]
(
	[Vorgesetzter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

