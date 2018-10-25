CREATE PROCEDURE [dbo].[pInsertArtikelgruppe]	@Artikelgruppe	NVARCHAR(50), 
												@AgBeschreibung	NVARCHAR(MAX)
AS

	-- Variable für neue ID
	DECLARE @NeueID INT;

	-- Daten einfügen
	BEGIN TRY
		INSERT INTO dbo.Artikelgruppen (Artikelgruppe, AgBeschreibung)
			 VALUES (@Artikelgruppe, @AgBeschreibung);
		SET @NeueID = (SELECT SCOPE_IDENTITY()); 
	END TRY
	BEGIN CATCH
		-- meine einheitliche Fehlerbehandlung
		THROW;
	END CATCH
	
	-- Daten ausgeben
	SELECT	@NeueID As NeueID;

RETURN 0
