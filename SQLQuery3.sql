-- 1. Перегляд активних оголошень
CREATE VIEW ActiveListings AS
SELECT l.ListingID, p.Address, p.Price, p.Area, p.Rooms, a.FullName AS AgentName, s.StatusName
FROM Listings l
JOIN Properties p ON l.PropertyID = p.PropertyID
JOIN Agents a ON l.AgentID = a.AgentID
JOIN ListingStatuses s ON l.StatusID = s.StatusID
WHERE s.StatusName = 'Active';
GO

-- 2. Перегляд договорів з платежами
CREATE VIEW ContractsWithPayments AS
SELECT c.ContractID, cl.FullName AS ClientName, ct.ContractName, SUM(p.Amount) AS TotalPayments
FROM Contracts c
JOIN Clients cl ON c.ClientID = cl.ClientID
JOIN ContractTypes ct ON c.ContractTypeID = ct.ContractTypeID
LEFT JOIN Payments p ON c.ContractID = p.ContractID
GROUP BY c.ContractID, cl.FullName, ct.ContractName;
GO

-- 3. Перегляд запитів клієнтів і відповідних нерухомостей
CREATE VIEW ClientRequestsWithProperties AS
SELECT cr.RequestID, cl.FullName AS ClientName, p.Address, p.Price, p.Area, p.Rooms
FROM ClientRequests cr
JOIN Clients cl ON cr.ClientID = cl.ClientID
JOIN Properties p ON p.Price BETWEEN cr.MinPrice AND cr.MaxPrice
AND p.Area BETWEEN cr.MinArea AND cr.MaxArea
AND p.Rooms BETWEEN cr.MinRooms AND cr.MaxRooms;
GO

-- 4. Перегляд рейтингу агентів
CREATE VIEW AgentRatings AS
SELECT a.AgentID, a.FullName, AVG(cr.Rating) AS AvgRating
FROM ClientReviews cr
JOIN Agents a ON cr.AgentID = a.AgentID
GROUP BY a.AgentID, a.FullName;
GO

-- 5. Перегляд деталей нерухомості
CREATE VIEW PropertyDetails AS
SELECT p.PropertyID, p.Address, pd.DescriptionText, pa.AttributeName, pa.AttributeValue
FROM Properties p
LEFT JOIN PropertyDescriptions pd ON p.PropertyID = pd.PropertyID
LEFT JOIN PropertyAttributes pa ON p.PropertyID = pa.PropertyID;
GO
