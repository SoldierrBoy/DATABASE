CREATE PROCEDURE GetListingStatuses
    @Filter NVARCHAR(50) = NULL,
    @SortOrder NVARCHAR(4) = 'ASC',
    @PageNumber INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    SELECT StatusID, StatusName
    FROM ListingStatuses
    WHERE (@Filter IS NULL OR StatusName LIKE '%' + @Filter + '%')
    ORDER BY StatusName
        OFFSET (@PageNumber - 1) * @PageSize ROWS
        FETCH NEXT @PageSize ROWS ONLY;
END;
GO
