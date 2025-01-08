-- 2. Таблиця: Типи нерухомості (PropertyTypes)
CREATE PROCEDURE SetPropertyType
    @PropertyTypeID INT = NULL,
    @TypeName NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @PropertyTypeID IS NULL
        BEGIN
            INSERT INTO PropertyTypes (TypeName)
            VALUES (@TypeName);
        END
        ELSE
        BEGIN
            UPDATE PropertyTypes
            SET TypeName = @TypeName
            WHERE PropertyTypeID = @PropertyTypeID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Property Type not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- 3. Таблиця: Статуси оголошень (ListingStatuses)
CREATE PROCEDURE SetListingStatus
    @StatusID INT = NULL,
    @StatusName NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @StatusID IS NULL
        BEGIN
            INSERT INTO ListingStatuses (StatusName)
            VALUES (@StatusName);
        END
        ELSE
        BEGIN
            UPDATE ListingStatuses
            SET StatusName = @StatusName
            WHERE StatusID = @StatusID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Listing Status not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- 4. Таблиця: Типи договорів (ContractTypes)
CREATE PROCEDURE SetContractType
    @ContractTypeID INT = NULL,
    @ContractName NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ContractTypeID IS NULL
        BEGIN
            INSERT INTO ContractTypes (ContractName)
            VALUES (@ContractName);
        END
        ELSE
        BEGIN
            UPDATE ContractTypes
            SET ContractName = @ContractName
            WHERE ContractTypeID = @ContractTypeID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Contract Type not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- 5. Таблиця: Клієнти (Clients)
CREATE PROCEDURE SetClient
    @ClientID INT = NULL,
    @FullName NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @CityID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ClientID IS NULL
        BEGIN
            INSERT INTO Clients (FullName, Phone, Email, CityID)
            VALUES (@FullName, @Phone, @Email, @CityID);
        END
        ELSE
        BEGIN
            UPDATE Clients
            SET FullName = @FullName,
                Phone = @Phone,
                Email = @Email,
                CityID = @CityID
            WHERE ClientID = @ClientID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Client not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- 6. Таблиця: Агенти (Agents)
CREATE PROCEDURE SetAgent
    @AgentID INT = NULL,
    @FullName NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @CityID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @AgentID IS NULL
        BEGIN
            INSERT INTO Agents (FullName, Phone, Email, CityID)
            VALUES (@FullName, @Phone, @Email, @CityID);
        END
        ELSE
        BEGIN
            UPDATE Agents
            SET FullName = @FullName,
                Phone = @Phone,
                Email = @Email,
                CityID = @CityID
            WHERE AgentID = @AgentID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Agent not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO