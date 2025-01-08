CREATE PROCEDURE CreateContract
    @ListingID INT,
    @ClientID INT,
    @ContractTypeID INT,
    @StartDate DATE,
    @EndDate DATE,
    @TotalAmount DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        -- Додаємо новий договір
        EXEC SetContract 
            @ContractID = NULL,
            @ListingID = @ListingID,
            @ClientID = @ClientID,
            @ContractTypeID = @ContractTypeID,
            @StartDate = @StartDate,
            @EndDate = @EndDate,
            @TotalAmount = @TotalAmount;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
