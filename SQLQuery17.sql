CREATE PROCEDURE SetPropertyDescription
    @DescriptionID INT = NULL,
    @PropertyID INT,
    @DescriptionText NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @DescriptionID IS NULL
        BEGIN
            INSERT INTO PropertyDescriptions (PropertyID, DescriptionText)
            VALUES (@PropertyID, @DescriptionText);
        END
        ELSE
        BEGIN
            UPDATE PropertyDescriptions
            SET PropertyID = @PropertyID,
                DescriptionText = @DescriptionText
            WHERE DescriptionID = @DescriptionID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Description not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
