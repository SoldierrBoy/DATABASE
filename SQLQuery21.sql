CREATE PROCEDURE CreateListing
    @Address NVARCHAR(255),
    @CityID INT,
    @PropertyTypeID INT,
    @Price DECIMAL(18, 2),
    @Area FLOAT,
    @Rooms INT,
    @Description NVARCHAR(MAX) = NULL,
    @AgentID INT,
    @StatusID INT,
    @ListingDate DATETIME,
    @ExpirationDate DATETIME
AS
BEGIN
    DECLARE @PropertyID INT;

    BEGIN TRY
        -- 1. Додаємо нову нерухомість
        EXEC SetProperty 
            @PropertyID = NULL,
            @Address = @Address,
            @CityID = @CityID,
            @PropertyTypeID = @PropertyTypeID,
            @Price = @Price,
            @Area = @Area,
            @Rooms = @Rooms,
            @Description = @Description;

        -- 2. Отримуємо ID доданої нерухомості
        SET @PropertyID = SCOPE_IDENTITY();

        -- 3. Створюємо оголошення
        EXEC SetListing 
            @ListingID = NULL,
            @PropertyID = @PropertyID,
            @AgentID = @AgentID,
            @StatusID = @StatusID,
            @ListingDate = @ListingDate,
            @ExpirationDate = @ExpirationDate;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
