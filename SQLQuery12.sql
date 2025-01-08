CREATE PROCEDURE SetContract
    @ContractID INT = NULL,
    @ListingID INT,
    @ClientID INT,
    @ContractTypeID INT,
    @StartDate DATE,
    @EndDate DATE,
    @TotalAmount DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ContractID IS NULL
        BEGIN
            INSERT INTO Contracts (ListingID, ClientID, ContractTypeID, StartDate, EndDate, TotalAmount)
            VALUES (@ListingID, @ClientID, @ContractTypeID, @StartDate, @EndDate, @TotalAmount);
        END
        ELSE
        BEGIN
            UPDATE Contracts
            SET ListingID = @ListingID,
                ClientID = @ClientID,
                ContractTypeID = @ContractTypeID,
                StartDate = @StartDate,
                EndDate = @EndDate,
                TotalAmount = @TotalAmount
            WHERE ContractID = @ContractID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Contract not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO