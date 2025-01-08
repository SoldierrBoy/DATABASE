CREATE PROCEDURE SetClientRequest
    @RequestID INT = NULL,
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
    SET NOCOUNT ON;
    BEGIN TRY
        IF @RequestID IS NULL
        BEGIN
            INSERT INTO ClientRequests (ClientID, PropertyTypeID, MinPrice, MaxPrice, MinArea, MaxArea, MinRooms, MaxRooms, RequestDate)
            VALUES (@ClientID, @PropertyTypeID, @MinPrice, @MaxPrice, @MinArea, @MaxArea, @MinRooms, @MaxRooms, @RequestDate);
        END
        ELSE
        BEGIN
            UPDATE ClientRequests
            SET ClientID = @ClientID,
                PropertyTypeID = @PropertyTypeID,
                MinPrice = @MinPrice,
                MaxPrice = @MaxPrice,
                MinArea = @MinArea,
                MaxArea = @MaxArea,
                MinRooms = @MinRooms,
                MaxRooms = @MaxRooms,
                RequestDate = @RequestDate
            WHERE RequestID = @RequestID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Request not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
