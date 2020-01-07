CREATE DATABASE DMProject;
USE DMProject;


/* Have a look at the data */
SELECT * FROM
dbo.fifaData;


/*Number of Records */
SELECT COUNT(*) AS NumOfRecords
FROM dbo.fifaData;

/*18207*/

/* Verify if ID is unique identifier */
SELECT COUNT(DISTINCT ID)
FROM dbo.fifaData
/*18207*/

/*Top 10 Nationalities Represented*/
SELECT TOP 10 Nationality,COUNT(ID) AS NumberOfPlayers
FROM dbo.fifaData
GROUP BY Nationality
ORDER BY NumberOfPlayers DESC;


/*Top 10 players in Overall Rating*/
SELECT TOP 10 Name,Overall
FROM dbo.fifaData
ORDER BY Overall DESC,Age;

/** Best Forwards **/
SELECT TOP 10 Name
FROM dbo.fifaData
WHERE POSITION IN ('RF','ST','LF','CF')
ORDER BY Overall DESC;

/** Best Defenders **/
SELECT TOP 10 Name
FROM dbo.fifaData
WHERE POSITION IN ('CB','LCB','RCB','RB','LB')
ORDER BY Overall DESC;

/** Top 10 Clubs which pay the Highest Wages **/
SELECT TOP 10 Club
FROM dbo.fifaData
GROUP BY Club
ORDER BY SUM(CAST(Wage AS INT)) DESC;

/** Average Wage of Top 10 Highest paid Defenders **/
SELECT AVG(CAST(Wage AS INT)) AS AvgWageDefender
FROM dbo.fifaData
WHERE ID IN(SELECT TOP 10 ID
FROM dbo.fifaData
WHERE POSITION IN ('CB','LCB','RCB','RB','LB')
ORDER BY CAST(Wage AS INT) DESC);

/** Average Wage of Top 10 Highest paid Forwards **/
SELECT AVG(CAST(Wage AS INT)) AS AvgWageForward
FROM dbo.fifaData
WHERE ID IN(SELECT TOP 10 ID
FROM dbo.fifaData
WHERE POSITION IN ('RF','ST','LF','CF')
ORDER BY CAST(Wage AS INT) DESC);

/** Average Wage of Top 10 Highest paid Midfielders **/
SELECT AVG(CAST(Wage AS INT)) AS AvgWageMidfield
FROM dbo.fifaData
WHERE ID IN(SELECT TOP 10 ID
FROM dbo.fifaData
WHERE POSITION IN ('RM','CM','RCM','LCM','CDM','LDM','RDM','LM','CAM','RAM','LAM')
ORDER BY CAST(Wage AS INT) DESC);

/**Average Wage of Top 10 Highest paid GoalKeepers**/
SELECT AVG(CAST(Wage AS INT)) AS AvgWageGK
FROM dbo.fifaData
WHERE ID IN(SELECT TOP 10 ID
FROM dbo.fifaData
WHERE POSITION = 'GK'
ORDER BY CAST(Wage AS INT) DESC);