USE [master]
GO
/****** Object:  Database [Real estate agency]    Script Date: 1/2/2025 7:25:14 PM ******/
CREATE DATABASE [Real estate agency]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Real estate agency', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DATABASESQL\MSSQL\DATA\Real estate agency.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Real estate agency_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DATABASESQL\MSSQL\DATA\Real estate agency_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Real estate agency] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Real estate agency].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Real estate agency] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Real estate agency] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Real estate agency] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Real estate agency] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Real estate agency] SET ARITHABORT OFF 
GO
ALTER DATABASE [Real estate agency] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Real estate agency] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Real estate agency] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Real estate agency] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Real estate agency] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Real estate agency] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Real estate agency] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Real estate agency] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Real estate agency] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Real estate agency] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Real estate agency] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Real estate agency] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Real estate agency] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Real estate agency] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Real estate agency] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Real estate agency] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Real estate agency] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Real estate agency] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Real estate agency] SET  MULTI_USER 
GO
ALTER DATABASE [Real estate agency] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Real estate agency] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Real estate agency] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Real estate agency] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Real estate agency] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Real estate agency] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Real estate agency] SET QUERY_STORE = ON
GO
ALTER DATABASE [Real estate agency] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Real estate agency]
GO
/****** Object:  Table [dbo].[Clients_History]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients_History](
	[ClientID] [int] NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[CityID] [int] NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_Clients_History]    Script Date: 1/2/2025 7:25:14 PM ******/
CREATE CLUSTERED INDEX [ix_Clients_History] ON [dbo].[Clients_History]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[CityID] [int] NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[Clients_History])
)
GO
/****** Object:  Table [dbo].[Agents_History]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents_History](
	[AgentID] [int] NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[CityID] [int] NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_Agents_History]    Script Date: 1/2/2025 7:25:14 PM ******/
CREATE CLUSTERED INDEX [ix_Agents_History] ON [dbo].[Agents_History]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[CityID] [int] NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[Agents_History])
)
GO
/****** Object:  Table [dbo].[Properties_History]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties_History](
	[PropertyID] [int] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[CityID] [int] NULL,
	[PropertyTypeID] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Area] [float] NOT NULL,
	[Rooms] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [ix_Properties_History]    Script Date: 1/2/2025 7:25:14 PM ******/
CREATE CLUSTERED INDEX [ix_Properties_History] ON [dbo].[Properties_History]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[PropertyID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[CityID] [int] NULL,
	[PropertyTypeID] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Area] [float] NOT NULL,
	[Rooms] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[Properties_History])
)
GO
/****** Object:  Table [dbo].[ListingStatuses]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListingStatuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listings]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listings](
	[ListingID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[AgentID] [int] NULL,
	[StatusID] [int] NULL,
	[ListingDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ActiveListings]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 1. Перегляд активних оголошень
CREATE VIEW [dbo].[ActiveListings] AS
SELECT l.ListingID, p.Address, p.Price, p.Area, p.Rooms, a.FullName AS AgentName, s.StatusName
FROM Listings l
JOIN Properties p ON l.PropertyID = p.PropertyID
JOIN Agents a ON l.AgentID = a.AgentID
JOIN ListingStatuses s ON l.StatusID = s.StatusID
WHERE s.StatusName = 'Active';
GO
/****** Object:  Table [dbo].[ContractTypes]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractTypes](
	[ContractTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ContractName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[ListingID] [int] NULL,
	[ClientID] [int] NULL,
	[ContractTypeID] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[TotalAmount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[ContractID] [int] NULL,
	[PaymentDate] [date] NULL,
	[Amount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ContractsWithPayments]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 2. Перегляд договорів з платежами
CREATE VIEW [dbo].[ContractsWithPayments] AS
SELECT c.ContractID, cl.FullName AS ClientName, ct.ContractName, SUM(p.Amount) AS TotalPayments
FROM Contracts c
JOIN Clients cl ON c.ClientID = cl.ClientID
JOIN ContractTypes ct ON c.ContractTypeID = ct.ContractTypeID
LEFT JOIN Payments p ON c.ContractID = p.ContractID
GROUP BY c.ContractID, cl.FullName, ct.ContractName;
GO
/****** Object:  Table [dbo].[ClientRequests]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[PropertyTypeID] [int] NULL,
	[MinPrice] [decimal](18, 2) NULL,
	[MaxPrice] [decimal](18, 2) NULL,
	[MinArea] [float] NULL,
	[MaxArea] [float] NULL,
	[MinRooms] [int] NULL,
	[MaxRooms] [int] NULL,
	[RequestDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ClientRequestsWithProperties]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 3. Перегляд запитів клієнтів і відповідних нерухомостей
CREATE VIEW [dbo].[ClientRequestsWithProperties] AS
SELECT cr.RequestID, cl.FullName AS ClientName, p.Address, p.Price, p.Area, p.Rooms
FROM ClientRequests cr
JOIN Clients cl ON cr.ClientID = cl.ClientID
JOIN Properties p ON p.Price BETWEEN cr.MinPrice AND cr.MaxPrice
AND p.Area BETWEEN cr.MinArea AND cr.MaxArea
AND p.Rooms BETWEEN cr.MinRooms AND cr.MaxRooms;
GO
/****** Object:  Table [dbo].[ClientReviews]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientReviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[AgentID] [int] NULL,
	[ReviewText] [nvarchar](max) NULL,
	[Rating] [int] NULL,
	[ReviewDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[AgentRatings]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 4. Перегляд рейтингу агентів
CREATE VIEW [dbo].[AgentRatings] AS
SELECT a.AgentID, a.FullName, AVG(cr.Rating) AS AvgRating
FROM ClientReviews cr
JOIN Agents a ON cr.AgentID = a.AgentID
GROUP BY a.AgentID, a.FullName;
GO
/****** Object:  Table [dbo].[PropertyAttributes]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyAttributes](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[AttributeName] [nvarchar](50) NULL,
	[AttributeValue] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyDescriptions]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyDescriptions](
	[DescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[DescriptionText] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[DescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[PropertyDetails]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 5. Перегляд деталей нерухомості
CREATE VIEW [dbo].[PropertyDetails] AS
SELECT p.PropertyID, p.Address, pd.DescriptionText, pa.AttributeName, pa.AttributeValue
FROM Properties p
LEFT JOIN PropertyDescriptions pd ON p.PropertyID = pd.PropertyID
LEFT JOIN PropertyAttributes pa ON p.PropertyID = pa.PropertyID;
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnerOrTenantContacts]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnerOrTenantContacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[FullName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyTypes]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyTypes](
	[PropertyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PropertyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agents] ON 

INSERT [dbo].[Agents] ([AgentID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (1, N'Oleg Kovalenko', N'0963123123', N'oleg@gmail.com', 1, CAST(N'2025-01-02T11:03:34.9401981' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Agents] ([AgentID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (2, N'Anna Shevchenko', N'0501321321', N'anna@gmail.com', 9, CAST(N'2025-01-02T11:04:05.8089100' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Agents] ([AgentID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (3, N'Pavel Durov', N'0969443732', N'paveldurov@gmail.com', 10, CAST(N'2025-01-02T11:04:57.3645956' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Agents] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (1, N'Ivano-Frankivsk')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (9, N'Kyiv')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (10, N'Lviv')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientRequests] ON 

INSERT [dbo].[ClientRequests] ([RequestID], [ClientID], [PropertyTypeID], [MinPrice], [MaxPrice], [MinArea], [MaxArea], [MinRooms], [MaxRooms], [RequestDate]) VALUES (1, 1, 2, CAST(30000.00 AS Decimal(18, 2)), CAST(60000.00 AS Decimal(18, 2)), 40, 67, 1, 3, CAST(N'2024-01-01' AS Date))
INSERT [dbo].[ClientRequests] ([RequestID], [ClientID], [PropertyTypeID], [MinPrice], [MaxPrice], [MinArea], [MaxArea], [MinRooms], [MaxRooms], [RequestDate]) VALUES (2, 3, 1, CAST(20000.00 AS Decimal(18, 2)), CAST(80000.00 AS Decimal(18, 2)), 45, 70, 1, 4, CAST(N'2025-01-02' AS Date))
INSERT [dbo].[ClientRequests] ([RequestID], [ClientID], [PropertyTypeID], [MinPrice], [MaxPrice], [MinArea], [MaxArea], [MinRooms], [MaxRooms], [RequestDate]) VALUES (3, 4, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), 10, 20, 1, 1, CAST(N'2025-01-02' AS Date))
SET IDENTITY_INSERT [dbo].[ClientRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientReviews] ON 

INSERT [dbo].[ClientReviews] ([ReviewID], [ClientID], [AgentID], [ReviewText], [Rating], [ReviewDate]) VALUES (1, 1, 1, N'Very helpful agent, fast service!', 5, CAST(N'2025-01-02' AS Date))
INSERT [dbo].[ClientReviews] ([ReviewID], [ClientID], [AgentID], [ReviewText], [Rating], [ReviewDate]) VALUES (2, 2, 2, N'Helped find my dream home!', 4, CAST(N'2025-01-02' AS Date))
INSERT [dbo].[ClientReviews] ([ReviewID], [ClientID], [AgentID], [ReviewText], [Rating], [ReviewDate]) VALUES (3, 3, 3, NULL, 5, CAST(N'2025-01-02' AS Date))
SET IDENTITY_INSERT [dbo].[ClientReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (1, N'Ivan Tymchuk', N'0507202946', N'ivan@gmail.com', 1, CAST(N'2025-01-02T11:01:04.6339660' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (2, N'Maria Petrenko', N'0987654321', N'maria@gmail.com', 9, CAST(N'2025-01-02T10:59:47.0245776' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (3, N'Petro Savchenko', N'0971112233', N'petro.savchenko@gmail.com', 9, CAST(N'2025-01-02T11:00:43.4851822' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (4, N'Olena Bondarenko', N'0953334455', N'olena.bond@gmail.com', 10, CAST(N'2025-01-02T11:01:12.3573230' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (5, N'Maksym Tkachenko', N'0635556677', N'maksym.tk@gmail.com', 1, CAST(N'2025-01-02T11:01:46.6313080' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (6, N'Oleksandr Danylenko', N'0679990001', N'oleksandr.dany@gmail.com', 10, CAST(N'2025-01-02T11:02:04.0299448' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
INSERT [dbo].[Clients_History] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (1, N'Ivan Tymchuk', N'380507202946', N'ivan@gmail.com', 1, CAST(N'2025-01-02T10:59:07.5840112' AS DateTime2), CAST(N'2025-01-02T11:01:04.6339660' AS DateTime2))
INSERT [dbo].[Clients_History] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (4, N'Olena Bondarenko', N'0953334455', NULL, NULL, CAST(N'2025-01-02T11:00:59.2090041' AS DateTime2), CAST(N'2025-01-02T11:01:12.3573230' AS DateTime2))
INSERT [dbo].[Clients_History] ([ClientID], [FullName], [Phone], [Email], [CityID], [ValidFrom], [ValidTo]) VALUES (5, N'Maksym Tkachenko', NULL, NULL, NULL, CAST(N'2025-01-02T11:01:30.6497112' AS DateTime2), CAST(N'2025-01-02T11:01:46.6313080' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([ContractID], [ListingID], [ClientID], [ContractTypeID], [StartDate], [EndDate], [TotalAmount]) VALUES (1, 1, 2, 2, CAST(N'2024-12-31' AS Date), CAST(N'2025-12-31' AS Date), CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[Contracts] ([ContractID], [ListingID], [ClientID], [ContractTypeID], [StartDate], [EndDate], [TotalAmount]) VALUES (2, 2, 1, 1, CAST(N'2024-12-31' AS Date), CAST(N'2025-12-31' AS Date), CAST(2100.00 AS Decimal(18, 2)))
INSERT [dbo].[Contracts] ([ContractID], [ListingID], [ClientID], [ContractTypeID], [StartDate], [EndDate], [TotalAmount]) VALUES (3, 3, 4, 4, CAST(N'2024-12-31' AS Date), CAST(N'2025-12-31' AS Date), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Contracts] ([ContractID], [ListingID], [ClientID], [ContractTypeID], [StartDate], [EndDate], [TotalAmount]) VALUES (4, 4, 3, 2, CAST(N'2024-12-31' AS Date), CAST(N'2025-12-31' AS Date), CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[Contracts] ([ContractID], [ListingID], [ClientID], [ContractTypeID], [StartDate], [EndDate], [TotalAmount]) VALUES (5, 5, 5, 2, CAST(N'2024-12-31' AS Date), CAST(N'2025-12-31' AS Date), CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[Contracts] ([ContractID], [ListingID], [ClientID], [ContractTypeID], [StartDate], [EndDate], [TotalAmount]) VALUES (6, 6, 6, 3, CAST(N'2024-12-31' AS Date), NULL, CAST(6000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[ContractTypes] ON 

INSERT [dbo].[ContractTypes] ([ContractTypeID], [ContractName]) VALUES (3, N'Long-term lease')
INSERT [dbo].[ContractTypes] ([ContractTypeID], [ContractName]) VALUES (1, N'Rent')
INSERT [dbo].[ContractTypes] ([ContractTypeID], [ContractName]) VALUES (2, N'Sale')
INSERT [dbo].[ContractTypes] ([ContractTypeID], [ContractName]) VALUES (4, N'Short-term lease')
SET IDENTITY_INSERT [dbo].[ContractTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Listings] ON 

INSERT [dbo].[Listings] ([ListingID], [PropertyID], [AgentID], [StatusID], [ListingDate], [ExpirationDate]) VALUES (1, 1, 2, 4, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Listings] ([ListingID], [PropertyID], [AgentID], [StatusID], [ListingDate], [ExpirationDate]) VALUES (2, 2, 1, 1, CAST(N'2024-01-15T00:00:00.000' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Listings] ([ListingID], [PropertyID], [AgentID], [StatusID], [ListingDate], [ExpirationDate]) VALUES (3, 3, 3, 1, CAST(N'2024-01-02T13:27:21.240' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Listings] ([ListingID], [PropertyID], [AgentID], [StatusID], [ListingDate], [ExpirationDate]) VALUES (4, 4, 2, 1, CAST(N'2024-01-02T13:27:22.400' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Listings] ([ListingID], [PropertyID], [AgentID], [StatusID], [ListingDate], [ExpirationDate]) VALUES (5, 5, 1, 1, CAST(N'2024-01-02T13:27:24.347' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Listings] ([ListingID], [PropertyID], [AgentID], [StatusID], [ListingDate], [ExpirationDate]) VALUES (6, 6, 3, 5, CAST(N'2024-01-02T13:27:28.033' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Listings] OFF
GO
SET IDENTITY_INSERT [dbo].[ListingStatuses] ON 

INSERT [dbo].[ListingStatuses] ([StatusID], [StatusName]) VALUES (1, N'Active')
INSERT [dbo].[ListingStatuses] ([StatusID], [StatusName]) VALUES (5, N'Expired')
INSERT [dbo].[ListingStatuses] ([StatusID], [StatusName]) VALUES (2, N'Inactive')
INSERT [dbo].[ListingStatuses] ([StatusID], [StatusName]) VALUES (3, N'Pending')
INSERT [dbo].[ListingStatuses] ([StatusID], [StatusName]) VALUES (4, N'Sold')
SET IDENTITY_INSERT [dbo].[ListingStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[OwnerOrTenantContacts] ON 

INSERT [dbo].[OwnerOrTenantContacts] ([ContactID], [PropertyID], [FullName], [Phone], [Email]) VALUES (1, 1, N'Maria Petrenko', N'0987654321', N'maria@gmail.com')
INSERT [dbo].[OwnerOrTenantContacts] ([ContactID], [PropertyID], [FullName], [Phone], [Email]) VALUES (2, 2, N'Ivan Tymchuk', N'0507202946', N'ivan@gmail.com')
INSERT [dbo].[OwnerOrTenantContacts] ([ContactID], [PropertyID], [FullName], [Phone], [Email]) VALUES (3, 3, N'Olena Bondarenko', N'0953334455', N'olena.bond@gmail.com')
INSERT [dbo].[OwnerOrTenantContacts] ([ContactID], [PropertyID], [FullName], [Phone], [Email]) VALUES (4, 4, N'Petro Savchenko', N'0971112233', N'petro.savchenko@gmail.com')
INSERT [dbo].[OwnerOrTenantContacts] ([ContactID], [PropertyID], [FullName], [Phone], [Email]) VALUES (5, 5, N'Maksym Tkachenko', N'0635556677', N'maksym.tk@gmail.com')
INSERT [dbo].[OwnerOrTenantContacts] ([ContactID], [PropertyID], [FullName], [Phone], [Email]) VALUES (6, 6, N'Oleksandr Danylenko', N'0679990001', N'oleksandr.dany@gmail.com')
SET IDENTITY_INSERT [dbo].[OwnerOrTenantContacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [ContractID], [PaymentDate], [Amount]) VALUES (1, 1, CAST(N'2024-05-21' AS Date), CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[Payments] ([PaymentID], [ContractID], [PaymentDate], [Amount]) VALUES (2, 2, CAST(N'2024-08-10' AS Date), CAST(2100.00 AS Decimal(18, 2)))
INSERT [dbo].[Payments] ([PaymentID], [ContractID], [PaymentDate], [Amount]) VALUES (3, 3, CAST(N'2024-10-19' AS Date), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Payments] ([PaymentID], [ContractID], [PaymentDate], [Amount]) VALUES (4, 4, CAST(N'2024-12-31' AS Date), CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[Payments] ([PaymentID], [ContractID], [PaymentDate], [Amount]) VALUES (5, 5, CAST(N'2025-10-28' AS Date), CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[Payments] ([PaymentID], [ContractID], [PaymentDate], [Amount]) VALUES (6, 6, NULL, CAST(6000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Properties] ON 

INSERT [dbo].[Properties] ([PropertyID], [Address], [CityID], [PropertyTypeID], [Price], [Area], [Rooms], [Description], [ValidFrom], [ValidTo]) VALUES (1, N'Soborna St, 12', 9, 1, CAST(75000.00 AS Decimal(18, 2)), 65, 3, N'Spacious apartment in the city center', CAST(N'2025-01-02T11:08:14.5943666' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Properties] ([PropertyID], [Address], [CityID], [PropertyTypeID], [Price], [Area], [Rooms], [Description], [ValidFrom], [ValidTo]) VALUES (2, N'Hrushevskogo St, 45', 1, 2, CAST(180000.00 AS Decimal(18, 2)), 150, 5, N'Modern house with a large backyard', CAST(N'2025-01-02T11:09:02.5764219' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Properties] ([PropertyID], [Address], [CityID], [PropertyTypeID], [Price], [Area], [Rooms], [Description], [ValidFrom], [ValidTo]) VALUES (3, N'Peremohy Ave, 10', 10, 3, CAST(120000.00 AS Decimal(18, 2)), 85, 4, N'Office space with parking for 10 cars', CAST(N'2025-01-02T11:09:44.6353585' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Properties] ([PropertyID], [Address], [CityID], [PropertyTypeID], [Price], [Area], [Rooms], [Description], [ValidFrom], [ValidTo]) VALUES (4, N'Lesi Ukrainky Blvd, 30', 9, 4, CAST(30000.00 AS Decimal(18, 2)), 40, 1, N'Garage with electric gate and heating', CAST(N'2025-01-02T11:10:38.1386549' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Properties] ([PropertyID], [Address], [CityID], [PropertyTypeID], [Price], [Area], [Rooms], [Description], [ValidFrom], [ValidTo]) VALUES (5, N'Zelena St, 22', 1, 5, CAST(100000.00 AS Decimal(18, 2)), 200, 0, N'Land plot for residential development', CAST(N'2025-01-02T11:11:14.3283470' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
INSERT [dbo].[Properties] ([PropertyID], [Address], [CityID], [PropertyTypeID], [Price], [Area], [Rooms], [Description], [ValidFrom], [ValidTo]) VALUES (6, N'Sychivska St, 55	', 10, 1, CAST(68000.00 AS Decimal(18, 2)), 55, 2, N'Cozy apartment with modern renovation', CAST(N'2025-01-02T11:14:03.1379858' AS DateTime2), CAST(N'9999-12-31T23:59:59.9999999' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Properties] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyAttributes] ON 

INSERT [dbo].[PropertyAttributes] ([AttributeID], [PropertyID], [AttributeName], [AttributeValue]) VALUES (1, 1, N'Number of Balconies', N'1')
INSERT [dbo].[PropertyAttributes] ([AttributeID], [PropertyID], [AttributeName], [AttributeValue]) VALUES (2, 2, N'Number of Garage''s', N'1')
INSERT [dbo].[PropertyAttributes] ([AttributeID], [PropertyID], [AttributeName], [AttributeValue]) VALUES (3, 3, N'Number of ParkPlace', N'10')
INSERT [dbo].[PropertyAttributes] ([AttributeID], [PropertyID], [AttributeName], [AttributeValue]) VALUES (4, 2, N'Number of ParkPlace', N'1')
SET IDENTITY_INSERT [dbo].[PropertyAttributes] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyDescriptions] ON 

INSERT [dbo].[PropertyDescriptions] ([DescriptionID], [PropertyID], [DescriptionText]) VALUES (1, 1, N'Spacious apartment in the city center')
INSERT [dbo].[PropertyDescriptions] ([DescriptionID], [PropertyID], [DescriptionText]) VALUES (2, 2, N'Modern house with a large backyard')
INSERT [dbo].[PropertyDescriptions] ([DescriptionID], [PropertyID], [DescriptionText]) VALUES (3, 3, N'Office space with parking for 10 cars')
INSERT [dbo].[PropertyDescriptions] ([DescriptionID], [PropertyID], [DescriptionText]) VALUES (4, 4, N'Garage with electric gate and heating')
INSERT [dbo].[PropertyDescriptions] ([DescriptionID], [PropertyID], [DescriptionText]) VALUES (5, 5, N'Garage with electric gate and heating')
INSERT [dbo].[PropertyDescriptions] ([DescriptionID], [PropertyID], [DescriptionText]) VALUES (6, 6, N'Cozy apartment with modern renovation')
SET IDENTITY_INSERT [dbo].[PropertyDescriptions] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyTypes] ON 

INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [TypeName]) VALUES (1, N'Apartment')
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [TypeName]) VALUES (4, N'Garage')
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [TypeName]) VALUES (2, N'House')
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [TypeName]) VALUES (5, N'Land')
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [TypeName]) VALUES (3, N'Office')
SET IDENTITY_INSERT [dbo].[PropertyTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Agents__5C7E359E277B00A4]    Script Date: 1/2/2025 7:25:14 PM ******/
ALTER TABLE [dbo].[Agents] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Agents__A9D10534F5AB26F9]    Script Date: 1/2/2025 7:25:14 PM ******/
ALTER TABLE [dbo].[Agents] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Cities__886159E55317F399]    Script Date: 1/2/2025 7:25:14 PM ******/
ALTER TABLE [dbo].[Cities] ADD UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clients__5C7E359EEE3BE218]    Script Date: 1/2/2025 7:25:14 PM ******/
ALTER TABLE [dbo].[Clients] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clients__A9D10534B6303145]    Script Date: 1/2/2025 7:25:14 PM ******/
ALTER TABLE [dbo].[Clients] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Contract__E45696DFBC4865C1]    Script Date: 1/2/2025 7:25:14 PM ******/
ALTER TABLE [dbo].[ContractTypes] ADD UNIQUE NONCLUSTERED 
(
	[ContractName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ListingS__05E7698AC7910CE0]    Script Date: 1/2/2025 7:25:14 PM ******/
ALTER TABLE [dbo].[ListingStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Property__D4E7DFA8B7D8EF00]    Script Date: 1/2/2025 7:25:14 PM ******/
ALTER TABLE [dbo].[PropertyTypes] ADD UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Agents] ADD  CONSTRAINT [DF_Agents_ValidFrom]  DEFAULT (sysutcdatetime()) FOR [ValidFrom]
GO
ALTER TABLE [dbo].[Agents] ADD  CONSTRAINT [DF_Agents_ValidTo]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [ValidTo]
GO
ALTER TABLE [dbo].[ClientRequests] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[ClientReviews] ADD  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_ValidFrom]  DEFAULT (sysutcdatetime()) FOR [ValidFrom]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_ValidTo]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [ValidTo]
GO
ALTER TABLE [dbo].[Listings] ADD  DEFAULT (getdate()) FOR [ListingDate]
GO
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Properties_ValidFrom]  DEFAULT (sysutcdatetime()) FOR [ValidFrom]
GO
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Properties_ValidTo]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [ValidTo]
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ClientRequests]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRequests]  WITH CHECK ADD FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[ClientReviews]  WITH CHECK ADD FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agents] ([AgentID])
GO
ALTER TABLE [dbo].[ClientReviews]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([ContractTypeID])
REFERENCES [dbo].[ContractTypes] ([ContractTypeID])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([ListingID])
REFERENCES [dbo].[Listings] ([ListingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Listings]  WITH CHECK ADD FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agents] ([AgentID])
GO
ALTER TABLE [dbo].[Listings]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Listings]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[ListingStatuses] ([StatusID])
GO
ALTER TABLE [dbo].[OwnerOrTenantContacts]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[PropertyAttributes]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropertyDescriptions]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientReviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[AddClientReview]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddClientReview]
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
/****** Object:  StoredProcedure [dbo].[CreateClientRequest]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateClientRequest]
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
    BEGIN TRY
        -- Додаємо запит клієнта
        EXEC SetClientRequest
            @RequestID = NULL,
            @ClientID = @ClientID,
            @PropertyTypeID = @PropertyTypeID,
            @MinPrice = @MinPrice,
            @MaxPrice = @MaxPrice,
            @MinArea = @MinArea,
            @MaxArea = @MaxArea,
            @MinRooms = @MinRooms,
            @MaxRooms = @MaxRooms,
            @RequestDate = @RequestDate;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateContract]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateContract]
    @ListingID INT,
    @ClientID INT,
    @ContractTypeID INT,
    @StartDate DATE,
    @EndDate DATE,
    @TotalAmount DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        -- Додаємо новий договір
        EXEC SetContract 
            @ContractID = NULL,
            @ListingID = @ListingID,
            @ClientID = @ClientID,
            @ContractTypeID = @ContractTypeID,
            @StartDate = @StartDate,
            @EndDate = @EndDate,
            @TotalAmount = @TotalAmount;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateListing]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateListing]
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
/****** Object:  StoredProcedure [dbo].[GetCities]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCities]
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
/****** Object:  StoredProcedure [dbo].[GetContractTypes]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetContractTypes]
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
/****** Object:  StoredProcedure [dbo].[GetListingStatuses]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListingStatuses]
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
/****** Object:  StoredProcedure [dbo].[GetPropertyTypes]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPropertyTypes]
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
/****** Object:  StoredProcedure [dbo].[MakePayment]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MakePayment]
    @ContractID INT,
    @PaymentDate DATE,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        -- Додаємо новий платіж
        EXEC SetPayment 
            @PaymentID = NULL,
            @ContractID = @ContractID,
            @PaymentDate = @PaymentDate,
            @Amount = @Amount;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SetAgent]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 6. Таблиця: Агенти (Agents)
CREATE PROCEDURE [dbo].[SetAgent]
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
/****** Object:  StoredProcedure [dbo].[SetCity]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetCity]
    @CityID INT = NULL,
    @CityName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @CityID IS NULL
        BEGIN
            INSERT INTO Cities (CityName)
            VALUES (@CityName);
        END
        ELSE
        BEGIN
            UPDATE Cities
            SET CityName = @CityName
            WHERE CityID = @CityID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'City not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SetClient]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 5. Таблиця: Клієнти (Clients)
CREATE PROCEDURE [dbo].[SetClient]
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
/****** Object:  StoredProcedure [dbo].[SetClientRequest]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetClientRequest]
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
/****** Object:  StoredProcedure [dbo].[SetClientReview]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetClientReview]
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
/****** Object:  StoredProcedure [dbo].[SetContract]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetContract]
    @ContractID INT = NULL,
    @ListingID INT,
    @ClientID INT,
    @ContractTypeID INT,
    @StartDate DATE,
    @EndDate DATE,
    @TotalAmount DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ContractID IS NULL
        BEGIN
            INSERT INTO Contracts (ListingID, ClientID, ContractTypeID, StartDate, EndDate, TotalAmount)
            VALUES (@ListingID, @ClientID, @ContractTypeID, @StartDate, @EndDate, @TotalAmount);
        END
        ELSE
        BEGIN
            UPDATE Contracts
            SET ListingID = @ListingID,
                ClientID = @ClientID,
                ContractTypeID = @ContractTypeID,
                StartDate = @StartDate,
                EndDate = @EndDate,
                TotalAmount = @TotalAmount
            WHERE ContractID = @ContractID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Contract not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[SetContractType]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 4. Таблиця: Типи договорів (ContractTypes)
CREATE PROCEDURE [dbo].[SetContractType]
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
/****** Object:  StoredProcedure [dbo].[SetListing]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetListing]
    @ListingID INT = NULL,
    @PropertyID INT,
    @AgentID INT,
    @StatusID INT,
    @ListingDate DATETIME,
    @ExpirationDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ListingID IS NULL
        BEGIN
            INSERT INTO Listings (PropertyID, AgentID, StatusID, ListingDate, ExpirationDate)
            VALUES (@PropertyID, @AgentID, @StatusID, @ListingDate, @ExpirationDate);
        END
        ELSE
        BEGIN
            UPDATE Listings
            SET PropertyID = @PropertyID,
                AgentID = @AgentID,
                StatusID = @StatusID,
                ListingDate = @ListingDate,
                ExpirationDate = @ExpirationDate
            WHERE ListingID = @ListingID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Listing not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[SetListingStatus]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 3. Таблиця: Статуси оголошень (ListingStatuses)
CREATE PROCEDURE [dbo].[SetListingStatus]
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
/****** Object:  StoredProcedure [dbo].[SetOwnerOrTenantContact]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetOwnerOrTenantContact]
    @ContactID INT = NULL,
    @PropertyID INT,
    @FullName NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ContactID IS NULL
        BEGIN
            INSERT INTO OwnerOrTenantContacts (PropertyID, FullName, Phone, Email)
            VALUES (@PropertyID, @FullName, @Phone, @Email);
        END
        ELSE
        BEGIN
            UPDATE OwnerOrTenantContacts
            SET PropertyID = @PropertyID,
                FullName = @FullName,
                Phone = @Phone,
                Email = @Email
            WHERE ContactID = @ContactID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Contact not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SetPayment]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetPayment]
    @PaymentID INT = NULL,
    @ContractID INT,
    @PaymentDate DATE,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @PaymentID IS NULL
        BEGIN
            INSERT INTO Payments (ContractID, PaymentDate, Amount)
            VALUES (@ContractID, @PaymentDate, @Amount);
        END
        ELSE
        BEGIN
            UPDATE Payments
            SET ContractID = @ContractID,
                PaymentDate = @PaymentDate,
                Amount = @Amount
            WHERE PaymentID = @PaymentID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Payment not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SetProperty]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetProperty]
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
/****** Object:  StoredProcedure [dbo].[SetPropertyAttribute]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetPropertyAttribute]
    @AttributeID INT = NULL,
    @PropertyID INT,
    @AttributeName NVARCHAR(50),
    @AttributeValue NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @AttributeID IS NULL
        BEGIN
            INSERT INTO PropertyAttributes (PropertyID, AttributeName, AttributeValue)
            VALUES (@PropertyID, @AttributeName, @AttributeValue);
        END
        ELSE
        BEGIN
            UPDATE PropertyAttributes
            SET PropertyID = @PropertyID,
                AttributeName = @AttributeName,
                AttributeValue = @AttributeValue
            WHERE AttributeID = @AttributeID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Attribute not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SetPropertyDescription]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetPropertyDescription]
    @DescriptionID INT = NULL,
    @PropertyID INT,
    @DescriptionText NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @DescriptionID IS NULL
        BEGIN
            INSERT INTO PropertyDescriptions (PropertyID, DescriptionText)
            VALUES (@PropertyID, @DescriptionText);
        END
        ELSE
        BEGIN
            UPDATE PropertyDescriptions
            SET PropertyID = @PropertyID,
                DescriptionText = @DescriptionText
            WHERE DescriptionID = @DescriptionID;

            IF @@ROWCOUNT = 0
                THROW 50000, 'Description not found', 1;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SetPropertyType]    Script Date: 1/2/2025 7:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 2. Таблиця: Типи нерухомості (PropertyTypes)
CREATE PROCEDURE [dbo].[SetPropertyType]
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
USE [master]
GO
ALTER DATABASE [Real estate agency] SET  READ_WRITE 
GO
