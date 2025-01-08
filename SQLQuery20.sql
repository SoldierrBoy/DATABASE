CREATE PROCEDURE SetProperty
    @PropertyID INT = NULL,
    @Address NVARCHAR(255),
    @CityID INT,
    @PropertyTypeID INT,
    @Price DECIMAL(18, 2),
    @Area FLOAT,
    @Rooms INT,
    @Description NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @PropertyID IS NULL
        BEGIN
            INSERT INTO Properties (Address, CityID, PropertyTypeID, Price, Area, Rooms, Description)
            VALUES (@Address, @CityID, @PropertyTypeID, @Price, @Area, @Rooms, @Description);
        END
        ELSE
        BEGIN
            UPDATE Properties
            SET Address = @Address,
                CityID = @CityID,
                PropertyTypeID = @PropertyTypeID,
                Price = @Price,
                Area = @Area,
                Rooms = @Rooms,
                Description = @Description
            WHERE PropertyID = @PropertyID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Property not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
