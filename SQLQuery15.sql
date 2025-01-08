CREATE PROCEDURE SetPayment
    @PaymentID INT = NULL,
    @ContractID INT,
    @PaymentDate DATE,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @PaymentID IS NULL
        BEGIN
            INSERT INTO Payments (ContractID, PaymentDate, Amount)
            VALUES (@ContractID, @PaymentDate, @Amount);
        END
        ELSE
        BEGIN
            UPDATE Payments
            SET ContractID = @ContractID,
                PaymentDate = @PaymentDate,
                Amount = @Amount
            WHERE PaymentID = @PaymentID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Payment not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
