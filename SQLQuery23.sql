CREATE PROCEDURE MakePayment
    @ContractID INT,
    @PaymentDate DATE,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        -- Додаємо новий платіж
        EXEC SetPayment 
            @PaymentID = NULL,
            @ContractID = @ContractID,
            @PaymentDate = @PaymentDate,
            @Amount = @Amount;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
