CREATE PROCEDURE GetPropertyTypes
    @Filter NVARCHAR(50) = NULL,
    @SortOrder NVARCHAR(4) = 'ASC',
    @PageNumber INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    SELECT PropertyTypeID, TypeName
    FROM PropertyTypes
    WHERE (@Filter IS NULL OR TypeName LIKE '%' + @Filter + '%')
    ORDER BY TypeName
        OFFSET (@PageNumber - 1) * @PageSize ROWS
        FETCH NEXT @PageSize ROWS ONLY;
END;
GO
