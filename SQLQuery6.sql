CREATE PROCEDURE SetCity
    @CityID INT = NULL,
    @CityName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @CityID IS NULL
        BEGIN
            INSERT INTO Cities (CityName)
            VALUES (@CityName);
        END
        ELSE
        BEGIN
            UPDATE Cities
            SET CityName = @CityName
            WHERE CityID = @CityID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'City not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
