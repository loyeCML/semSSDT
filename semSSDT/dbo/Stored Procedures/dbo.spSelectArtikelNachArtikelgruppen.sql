-- Gespeicherte Prozdure zur Ausgabe von Artikeldaten abhängig von der Artikelgruppe
CREATE PROC [dbo].[spSelectArtikelNachArtikelgruppen] @Artikelgruppe nvarchar(50)
AS
SET NOCOUNT ON;

	SELECT	Artikel, Matchcode, Verkaufspreis, Artikelgruppe 
	FROM	dbo.Artikel INNER JOIN dbo.Artikelgruppen 
			ON dbo.Artikel.ArtikelgruppeID = dbo.Artikelgruppen.ArtikelgruppeID
	WHERE	dbo.Artikelgruppen.Artikelgruppe = @Artikelgruppe;

-- EXEC dbo.sp_SelectArtikelNachArtikelgruppen 'Herrensocke "Klassik"';
