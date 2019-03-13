USE[OrderSaleProcess]
DROP TABLE [Calendar]
CREATE TABLE [Calendar]
(
[DateID] [int] IDENTITY(1,1) NOT NULL,
[CalendarDate] DATETIME
, WeekDayName nvarchar(50)
, MonthName nvarchar(50)
, Year int
CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go
DECLARE @StartDate DATETIME
DECLARE @EndDate DATETIME
SET @StartDate = '1996-01-01'
SET @EndDate = DATEADD(d, 1095,
@StartDate)
WHILE @StartDate <= @EndDate
BEGIN
INSERT INTO [Calendar]
(
CalendarDate
,WeekDayName
,MonthName
,Year
)
SELECT
@StartDate
,DATENAME(weekday,@startDate)
,DATENAME(month, @StartDate )
,DATENAME(year,@StartDate)
SET @StartDate = DATEADD(dd, 1, @StartDate)
END