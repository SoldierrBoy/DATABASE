CREATE PROCEDURE SetListing
    @ListingID INT = NULL,
    @PropertyID INT,
    @AgentID INT,
    @StatusID INT,
    @ListingDate DATETIME,
    @ExpirationDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ListingID IS NULL
        BEGIN
            INSERT INTO Listings (PropertyID, AgentID, StatusID, ListingDate, ExpirationDate)
            VALUES (@PropertyID, @AgentID, @StatusID, @ListingDate, @ExpirationDate);
        END
        ELSE
        BEGIN
            UPDATE Listings
            SET PropertyID = @PropertyID,
                AgentID = @AgentID,
                StatusID = @StatusID,
                ListingDate = @ListingDate,
                ExpirationDate = @ExpirationDate
            WHERE ListingID = @ListingID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Listing not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
