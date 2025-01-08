CREATE PROCEDURE SetClientReview
    @ReviewID INT = NULL,
    @ClientID INT,
    @AgentID INT,
    @ReviewText NVARCHAR(MAX),
    @Rating INT,
    @ReviewDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ReviewID IS NULL
        BEGIN
            INSERT INTO ClientReviews (ClientID, AgentID, ReviewText, Rating, ReviewDate)
            VALUES (@ClientID, @AgentID, @ReviewText, @Rating, @ReviewDate);
        END
        ELSE
        BEGIN
            UPDATE ClientReviews
            SET ClientID = @ClientID,
                AgentID = @AgentID,
                ReviewText = @ReviewText,
                Rating = @Rating,
                ReviewDate = @ReviewDate
            WHERE ReviewID = @ReviewID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Review not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
