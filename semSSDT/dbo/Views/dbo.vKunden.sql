-- Sicht zur Ausgabe der Kundendaten
CREATE VIEW [dbo].[vKunden]
AS
	SELECT	[KontaktID], [Kontaktart], [Firma], [Namenszusatz], [Strasse], [Ort], [Region], [PLZ], [Staat], [Telefon], [Telefax], [Email], [iTS]
	FROM	dbo.Kontakte
	WHERE	Kontaktart = 'K';