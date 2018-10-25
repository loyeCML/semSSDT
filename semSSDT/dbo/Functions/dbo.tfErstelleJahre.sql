-- Tabellenwertfunktion zur Ausgabe von mehreren Jahreszahlen
CREATE FUNCTION [dbo].[tfErstelleJahre] (@StartJahr int, @Anzahl int)
RETURNS @Jahre TABLE (Jahr int)
AS
BEGIN
	DECLARE @Zaehler int = 0;

	WHILE @Zaehler <= @Anzahl
	BEGIN
		INSERT INTO @Jahre VALUES (@StartJahr);
		SET @StartJahr = @StartJahr + 1;
		SET @Zaehler = @Zaehler + 1;
	END

	RETURN
END
