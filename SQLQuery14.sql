CREATE PROCEDURE SetOwnerOrTenantContact
    @ContactID INT = NULL,
    @PropertyID INT,
    @FullName NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ContactID IS NULL
        BEGIN
            INSERT INTO OwnerOrTenantContacts (PropertyID, FullName, Phone, Email)
            VALUES (@PropertyID, @FullName, @Phone, @Email);
        END
        ELSE
        BEGIN
            UPDATE OwnerOrTenantContacts
            SET PropertyID = @PropertyID,
                FullName = @FullName,
                Phone = @Phone,
                Email = @Email
            WHERE ContactID = @ContactID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Contact not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
