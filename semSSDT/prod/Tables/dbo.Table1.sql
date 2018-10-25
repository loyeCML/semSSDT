CREATE TABLE [prod].[Produktgruppen]
(
	[ProduktgruppeID] INT NOT NULL CONSTRAINT PK_Prod_Produktgruppen_PID PRIMARY KEY IDENTITY(2, 3),
	Produktgruppe Nvarchar(50) not null ,
	PBeschreibung NVArchar(Max) null
)

GO

CREATE INDEX [UK_Prod_Produktgruppen_Produktgruppe] ON [prod].[Produktgruppen] (Produktgruppe)
