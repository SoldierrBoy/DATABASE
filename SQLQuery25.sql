CREATE PROCEDURE AddClientReview
    @ClientID INT,
    @AgentID INT,
    @ReviewText NVARCHAR(MAX),
    @Rating INT,
    @ReviewDate DATE
AS
BEGIN
    BEGIN TRY
        -- Додаємо відгук
        EXEC SetClientReview
            @ReviewID = NULL,
            @ClientID = @ClientID,
            @AgentID = @AgentID,
            @ReviewText = @ReviewText,
            @Rating = @Rating,
            @ReviewDate = @ReviewDate;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
