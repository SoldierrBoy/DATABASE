CREATE PROCEDURE GetCities
    @Filter NVARCHAR(100) = NULL,
    @SortOrder NVARCHAR(4) = 'ASC',
    @PageNumber INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    SELECT CityID, CityName
    FROM Cities
    WHERE (@Filter IS NULL OR CityName LIKE '%' + @Filter + '%')
    ORDER BY CityName 
        OFFSET (@PageNumber - 1) * @PageSize ROWS
        FETCH NEXT @PageSize ROWS ONLY;
END;
GO
