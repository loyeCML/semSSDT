CREATE VIEW [dbo].[Auslaufartikel]
	AS SELECT Matchcode, Artikel,ArtikelgruppeID, KontaktID, Inaktiv FROM [Artikel] where Inaktiv = 1
