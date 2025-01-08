CREATE PROCEDURE SetPropertyAttribute
    @AttributeID INT = NULL,
    @PropertyID INT,
    @AttributeName NVARCHAR(50),
    @AttributeValue NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @AttributeID IS NULL
        BEGIN
            INSERT INTO PropertyAttributes (PropertyID, AttributeName, AttributeValue)
            VALUES (@PropertyID, @AttributeName, @AttributeValue);
        END
        ELSE
        BEGIN
            UPDATE PropertyAttributes
            SET PropertyID = @PropertyID,
                AttributeName = @AttributeName,
                AttributeValue = @AttributeValue
            WHERE AttributeID = @AttributeID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Attribute not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
