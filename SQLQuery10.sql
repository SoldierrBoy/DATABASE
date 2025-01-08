CREATE PROCEDURE GetContractTypes
    @Filter NVARCHAR(50) = NULL,
    @SortOrder NVARCHAR(4) = 'ASC',
    @PageNumber INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ContractTypeID, ContractName
    FROM ContractTypes
    WHERE (@Filter IS NULL OR ContractName LIKE '%' + @Filter + '%')
    ORDER BY ContractName
        OFFSET (@PageNumber - 1) * @PageSize ROWS
        FETCH NEXT @PageSize ROWS ONLY;
END;
GO
