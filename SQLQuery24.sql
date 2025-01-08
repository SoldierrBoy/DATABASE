CREATE PROCEDURE CreateClientRequest
    @ClientID INT,
    @PropertyTypeID INT,
    @MinPrice DECIMAL(18, 2),
    @MaxPrice DECIMAL(18, 2),
    @MinArea FLOAT,
    @MaxArea FLOAT,
    @MinRooms INT,
    @MaxRooms INT,
    @RequestDate DATE
AS
BEGIN
    BEGIN TRY
        -- Додаємо запит клієнта
        EXEC SetClientRequest
            @RequestID = NULL,
            @ClientID = @ClientID,
            @PropertyTypeID = @PropertyTypeID,
            @MinPrice = @MinPrice,
            @MaxPrice = @MaxPrice,
            @MinArea = @MinArea,
            @MaxArea = @MaxArea,
            @MinRooms = @MinRooms,
            @MaxRooms = @MaxRooms,
            @RequestDate = @RequestDate;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
