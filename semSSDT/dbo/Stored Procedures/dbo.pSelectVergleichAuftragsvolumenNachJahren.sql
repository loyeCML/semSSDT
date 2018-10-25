-- Gespeicherte Prozdure zur Ausgabe vom Auftragsvolumen zweier Jahre
CREATE PROC [dbo].[pSelectVergleichAuftragsvolumenNachJahren]	@Jahr			INT,
																@Vergleichsjahr INT
AS

SET NOCOUNT ON;

-- Table-Variable
DECLARE @tabErgebnis TABLE
(	
	KontaktID						INT				NOT NULL,
	Firma							NVARCHAR(255),
	Adresse							NVARCHAR(255),
	Jahr							INT,
	Vergleichsjahr					INT,
	SummeAuftraegeJahr				MONEY			DEFAULT (0),
	SummeAuftraegeVergleichsJahr	MONEY			DEFAULT (0)
);

-- Variablen
DECLARE @KontaktID						INT				= NULL,
		@Firma							NVARCHAR(50)	= NULL,
		@Namenszusatz					NVARCHAR(50)	= NULL,
		@Strasse						NVARCHAR(50)	= NULL,
		@PLZ							NVARCHAR(50)	= NULL,
		@Ort							NVARCHAR(50)	= NULL,		 
		@Adresse						NVARCHAR(150)	= NULL, 
		@SummeAuftraegeJahr				MONEY			= NULL,
		@SummeAuftraegeVergleichsJahr	MONEY			= NULL, 
		@ErsterTagJahr					DATETIME2(0)	= NULL,
		@LetzterTagJahr					DATETIME2(0)	= NULL,
		@ErsterTagVergleichsJahr		DATETIME2(0)	= NULL,
		@LetzterTagVergleichsJahr		DATETIME2(0)	= NULL,
		@FehlerBeschreibung				NVARCHAR(2048)	= NULL,
		@FehlerSchweregrad				INT				= NULL,
		@FehlerStatus					INT				= NULL;

-- Variablen für Datumsbereiche initialisieren
SET @ErsterTagJahr = DATEFROMPARTS(@Jahr, 1, 1);
SET @LetzterTagJahr = DATEFROMPARTS(@Jahr + 1, 1, 1);
SET @ErsterTagVergleichsJahr = DATEFROMPARTS(@Vergleichsjahr, 1, 1);
SET @LetzterTagVergleichsJahr = DATEFROMPARTS(@Vergleichsjahr + 1, 1, 1);

-- Cursor mit Anzahl vom Vorjahr und aktuellem Jahr ermitteln
DECLARE curBestellungen CURSOR READ_ONLY 
FOR
SELECT	KontaktID, Firma, Namenszusatz, Strasse, PLZ, Ort
FROM	dbo.Kontakte
WHERE	Kontaktart = 'K';

-- Cursor öffnen
OPEN curBestellungen;
FETCH NEXT FROM curBestellungen INTO @KontaktID, @Firma, @Namenszusatz, @Strasse, @PLZ, @Ort
WHILE @@FETCH_STATUS = 0
   BEGIN 
		BEGIN TRY
		
			-- Adresse erstellen
			SET @Adresse = Concat(@Namenszusatz, ' - ' , @PLZ , ' ', @Ort);

			-- Kunde speichern
			INSERT INTO	@tabErgebnis (KontaktID, Firma, Adresse)
				 VALUES (@KontaktID, @Firma, @Adresse);

			-- Summen und Anzahl vom Ausgangsjahr ermitteln
			SELECT	
					@SummeAuftraegeJahr = CAST(SUM((Einzelpreis * Menge)) AS MONEY)
			  FROM	
					dbo.Auftraege 
					INNER JOIN dbo.Auftragspositionen 
							ON dbo.Auftraege.AuftragID = dbo.Auftragspositionen.AuftragID
			 WHERE	
					dbo.Auftraege.KontaktID = @KontaktID 
					AND
					Auftragsdatum >= @ErsterTagJahr AND Auftragsdatum < @LetzterTagJahr;

			-- Summen und Anzahl vom Vergleichsjahr ermitteln
			SELECT	
					@SummeAuftraegeVergleichsJahr = CAST(SUM((Einzelpreis * Menge)) AS MONEY)
			  FROM	
					dbo.Auftraege 
					INNER JOIN dbo.Auftragspositionen 
							ON dbo.Auftraege.AuftragID = dbo.Auftragspositionen.AuftragID
			 WHERE	
					dbo.Auftraege.KontaktID = @KontaktID 
					AND 
					Auftragsdatum >= @ErsterTagVergleichsJahr AND Auftragsdatum < @LetzterTagVergleichsJahr;

			-- Summe und Anzahl speichern
			UPDATE	
					@tabErgebnis
			   SET	
					SummeAuftraegeJahr = ISNULL(@SummeAuftraegeJahr, 0),
					SummeAuftraegeVergleichsJahr = ISNULL(@SummeAuftraegeVergleichsJahr, 0),
					Jahr = @Jahr,
					Vergleichsjahr = @Vergleichsjahr
			 WHERE	
					KontaktID = @KontaktID;

		END TRY
		BEGIN CATCH 
			SET @FehlerBeschreibung = ERROR_MESSAGE();
			SET @FehlerSchweregrad = ERROR_SEVERITY();
			SET @FehlerStatus = ERROR_STATE();
			RAISERROR (@FehlerBeschreibung, @FehlerSchweregrad, @FehlerStatus);
		END CATCH

      FETCH NEXT FROM curBestellungen INTO @KontaktID, @Firma, @Namenszusatz, @Strasse, @PLZ, @Ort
   END;
CLOSE curBestellungen;
DEALLOCATE curBestellungen;
 
-- Ausgabe vom Ergebnis
SELECT	
		KontaktID, Firma, Adresse,
		Jahr, SummeAuftraegeJahr, 
		Vergleichsjahr, SummeAuftraegeVergleichsJahr,
		SummeAuftraegeJahr - SummeAuftraegeVergleichsJahr As DifferenzSummeJahrZuVergleichsJahr
FROM 
		@tabErgebnis 
ORDER BY 
		Firma;

-- EXEC dbo.pSelectVergleichAuftragsvolumenNachJahren 2015, 2016;
