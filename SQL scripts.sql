----------------Data Cleaning Process---------------------

WITH

cleaned_date AS
(

--a) Standardizing game dates data type
	SELECT CAST(GAME_DATE_EST AS date) AS Game_Date_EST

--b) Selecting necessary columns from games.csv
			,GAME_ID
			,HOME_TEAM_ID
			,VISITOR_TEAM_ID
			,SEASON + 1 AS "SEASON"

			,FG_PCT_home * 100 AS "FG_PCT_home"
			,FT_PCT_home * 100 AS "FT_PCT_home"
			,FG3_PCT_home * 100 AS "FG3_PCT_home"
			,AST_home
			,REB_home

			,FG_PCT_away * 100 AS "FG_PCT_away"
			,FT_PCT_away * 100 AS "FT_PCT_away"
			,FG3_PCT_away * 100 AS "FG3_PCT_away"
			,AST_away
			,REB_away

--c) Classifying games whether they occurred during the regular season, play-in tournament, or postseason
			,CASE WHEN GAME_DATE_EST BETWEEN '2003-10-28' AND '2004-04-14' THEN 'Regular Season' --2004 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2004-04-17' AND '2004-06-15' THEN 'Postseason' --2004 Postseason

					WHEN GAME_DATE_EST BETWEEN '2004-11-02' AND '2005-04-20' THEN 'Regular Season' --2005 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2005-04-23' AND '2005-06-23' THEN 'Postseason' --2005 Postseason

					WHEN GAME_DATE_EST BETWEEN '2005-11-01' AND '2006-04-19' THEN 'Regular Season' --2006 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2006-04-22' AND '2006-06-20' THEN 'Postseason' --2006 Postseason

					WHEN GAME_DATE_EST BETWEEN '2006-10-31' AND '2007-04-18' THEN 'Regular Season' --2007 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2007-04-21' AND '2007-06-14' THEN 'Postseason' --2007 Postseason

					WHEN GAME_DATE_EST BETWEEN '2007-10-30' AND '2008-04-16' THEN 'Regular Season' --2008 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2008-04-19' AND '2008-06-17' THEN 'Postseason' --2008 Postseason

					WHEN GAME_DATE_EST BETWEEN '2008-10-28' AND '2009-04-16' THEN 'Regular Season' --2009 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2009-04-18' AND '2009-06-14' THEN 'Postseason' --2009 Postseason

					WHEN GAME_DATE_EST BETWEEN '2009-10-27' AND '2010-04-14' THEN 'Regular Season' --2010 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2010-04-17' AND '2010-06-17' THEN 'Postseason' --2010 Postseason

					WHEN GAME_DATE_EST BETWEEN '2010-10-26' AND '2011-04-13' THEN 'Regular Season' --2011 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2011-04-16' AND '2011-06-12' THEN 'Postseason' --2011 Postseason

					WHEN GAME_DATE_EST BETWEEN '2011-12-25' AND '2012-04-26' THEN 'Regular Season' --2012 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2012-04-28' AND '2012-06-21' THEN 'Postseason' --2012 Postseason

					WHEN GAME_DATE_EST BETWEEN '2012-11-30' AND '2013-04-17' THEN 'Regular Season' --2013 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2013-04-20' AND '2013-06-20' THEN 'Postseason' --2013 Postseason

					WHEN GAME_DATE_EST BETWEEN '2013-11-29' AND '2014-04-16' THEN 'Regular Season' --2014 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2014-04-19' AND '2014-06-15' THEN 'Postseason' --2014 Postseason

					WHEN GAME_DATE_EST BETWEEN '2014-10-28' AND '2015-04-15' THEN 'Regular Season' --2015 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2015-04-18' AND '2015-06-16' THEN 'Postseason' --2015 Postseason
					
					WHEN GAME_DATE_EST BETWEEN '2015-10-27' AND '2016-04-13' THEN 'Regular Season' --2016 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2016-04-16' AND '2016-06-19' THEN 'Postseason' --2016 Postseason

					WHEN GAME_DATE_EST BETWEEN '2016-10-25' AND '2017-04-12' THEN 'Regular Season' --2017 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2017-04-15' AND '2017-06-12' THEN 'Postseason' --2017 Postseason

					WHEN GAME_DATE_EST BETWEEN '2017-10-17' AND '2018-04-11' THEN 'Regular Season' --2018 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2018-04-14' AND '2018-06-08' THEN 'Postseason' --2018 Postseason

					WHEN GAME_DATE_EST BETWEEN '2018-10-16' AND '2019-04-10' THEN 'Regular Season' --2019 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2019-04-13' AND '2019-06-13' THEN 'Postseason' --2019 Postseason

					WHEN GAME_DATE_EST BETWEEN '2019-10-22' AND '2020-08-14' THEN 'Regular Season' --2020 Regular Season
					WHEN GAME_DATE_EST = '2020-08-15' THEN 'Play-in' --2020 Play-in game
					WHEN GAME_DATE_EST BETWEEN '2020-08-17' AND '2020-10-11' THEN 'Postseason' --2020 Postseason

					WHEN GAME_DATE_EST BETWEEN '2020-12-22' AND '2021-05-16' THEN 'Regular Season' --2021 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2021-05-18' AND '2021-05-21' THEN 'Play-in' --2021 Play-in game
					WHEN GAME_DATE_EST BETWEEN '2021-05-22' AND '2021-06-20' THEN 'Postseason' --2021 Postseason

					WHEN GAME_DATE_EST BETWEEN '2021-10-19' AND '2022-04-10' THEN 'Regular Season' --2022 Regular Season
					WHEN GAME_DATE_EST BETWEEN '2022-04-12' AND '2022-04-15' THEN 'Play-in' --2022 Play-in game
					WHEN GAME_DATE_EST BETWEEN '2022-04-16' AND '2022-06-16' THEN 'Postseason' --2022 Postseason

					ELSE NULL END AS GAME_TYPE
	FROM dbo.games

--d) Filtering the games only between 28 Oct 2003 until 22 Dec 2022
	WHERE GAME_DATE_EST BETWEEN '2003-10-28' AND '2022-06-16'
),

--e) Checking duplicates
check_duplicates AS
(
	SELECT *
			,ROW_NUMBER() OVER (
				PARTITION BY Game_Date_EST
							,GAME_ID
							,HOME_TEAM_ID
							,VISITOR_TEAM_ID
							,SEASON
							,FG_PCT_home
							,FT_PCT_home
							,FG3_PCT_home
							,AST_home
							,REB_home
							,FG_PCT_away
							,FT_PCT_away
							,FG3_PCT_away
							,AST_away
							,REB_away
							,GAME_TYPE
				ORDER BY Game_Date_EST) duplicate_num
	FROM cleaned_date
),

--f) Checking value ranges of the columns--

--Checking the number of distinct HOME_TEAM_ID
check_HOME_TEAM_ID AS
(
	SELECT COUNT(DISTINCT HOME_TEAM_ID) count_HOME_TEAM_ID
	FROM cleaned_date
),

--Checking the number of distinct VISITOR_TEAM_ID
check_VISITOR_TEAM_ID AS
(
	SELECT COUNT(DISTINCT VISITOR_TEAM_ID) count_VISITOR_TEAM_ID
	FROM cleaned_date
),

--Checking SEASON range
check_SEASON AS
(
	SELECT SEASON
	FROM cleaned_date
	WHERE SEASON NOT BETWEEN '2004' AND '2022'
),

--Checking FG_PCT_HOME range
check_FG_PCT_HOME AS
(
	SELECT FG_PCT_HOME
	FROM cleaned_date
	WHERE FG_PCT_HOME <0 OR FG_PCT_HOME > 100
),

--Checking FG_PCT_HOME range
check_FT_PCT_HOME AS
(
	SELECT FT_PCT_HOME
	FROM cleaned_date
	WHERE FT_PCT_HOME <0 OR FT_PCT_HOME > 100
),

--Checking FG3_PCT_HOME range
check_FG3_PCT_HOME AS
(
	SELECT FG3_PCT_HOME
	FROM cleaned_date
	WHERE FG3_PCT_HOME <0 OR FG3_PCT_HOME > 100
),

--Checking FG_PCT_HOME range
check_FG_PCT_AWAY AS
(
	SELECT FG_PCT_AWAY
	FROM cleaned_date
	WHERE FG_PCT_AWAY <0 OR FG_PCT_AWAY > 100
),

--Checking FG_PCT_HOME range
check_FT_PCT_AWAY AS
(
	SELECT FT_PCT_AWAY
	FROM cleaned_date
	WHERE FT_PCT_AWAY <0 OR FT_PCT_AWAY > 100
),

--Checking FG3_PCT_HOME range
check_FG3_PCT_AWAY AS
(
	SELECT FG3_PCT_AWAY
	FROM cleaned_date
	WHERE FG3_PCT_AWAY <0 OR FG3_PCT_AWAY > 100
),

--Checking AST_HOME range
check_AST_HOME AS
(
	SELECT AST_HOME
	FROM cleaned_date
	WHERE AST_HOME < 0
),

--Checking AST_AWAY range
check_AST_AWAY AS
(
	SELECT AST_AWAY
	FROM cleaned_date
	WHERE AST_AWAY < 0
),

--Checking REB_HOME range
check_REB_HOME AS
(
	SELECT REB_HOME
	FROM cleaned_date
	WHERE REB_HOME < 0
),

--Checking REB_AWAY range
check_REB_AWAY AS
(
	SELECT REB_AWAY
	FROM cleaned_date
	WHERE REB_AWAY < 0
),

--Identifying the home teams in every game
teams_HOME AS
(
	SELECT c.*
			,CASE WHEN c.HOME_TEAM_ID = t.TEAM_ID THEN t.NICKNAME
			ELSE NULL END AS Home_Team
			
	FROM cleaned_date c
	LEFT JOIN dbo.teams t
	ON c.HOME_TEAM_ID = t.TEAM_ID
),

--Identifying the visitor teams in every game
teams_AWAY AS
(
	SELECT h.*
			,CASE WHEN h.VISITOR_TEAM_ID = t.TEAM_ID THEN t.NICKNAME
			ELSE NULL END AS Away_Team
			
	FROM teams_HOME h
	LEFT JOIN dbo.teams t
	ON h.VISITOR_TEAM_ID = t.TEAM_ID
),
-------------------------------------------------------------------------------------------------
----------------Exploratory Data Analysis Process---------------------

--Average field goal percentage during REGULAR SEASON


--Average field goal percentage by the home teams
average_fg_pct_HOME AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(FG_PCT_home) AS avg_fg_pct_HOME
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average field goal percentage by the visitor teams
average_fg_pct_AWAY AS
(
	SELECT SEASON
			,GAME_TYPE
			,Away_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Away_Team AS Team
			,AVG(FG_PCT_away) AS avg_fg_pct_AWAY
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON,GAME_TYPE,Away_Team
),

--Average field goal percentage COMBINING home and visitor percentage
average_fg_pct_COMBINE AS
(
	SELECT h.SEASON AS "SEASON"
			,h.GAME_TYPE AS "GAME_TYPE"
			,h.Home_Team AS Team
			,h.avg_fg_pct_HOME avg_fg_pct_HOME
			,a.avg_fg_pct_AWAY avg_fg_pct_AWAY
			,(avg_fg_pct_HOME + avg_fg_pct_AWAY)/2 AS Combination
	FROM average_fg_pct_HOME h
	FULL JOIN average_fg_pct_AWAY a
	ON h.Team = a.Team
),

--Ranking the average field goal percentage of teams per season

rank_avg_fg_pct AS
(
SELECT *
		,RANK() OVER (
				PARTITION BY SEASON
				ORDER BY Combination DESC
		) avg_fg_pct_RANK
FROM average_fg_pct_COMBINE
),

champ_avg_fg_pct AS
(
SELECT *
	,CASE WHEN SEASON = '2004' AND Team = 'Pistons' THEN 'champion'
			WHEN SEASON = '2005' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2006' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2007' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2008' AND Team = 'Celtics' THEN 'champion'
			WHEN SEASON = '2009' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2010' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2011' AND Team = 'Mavericks' THEN 'champion'
			WHEN SEASON = '2012' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2013' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2014' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2015' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2016' AND Team = 'Cavaliers' THEN 'champion'
			WHEN SEASON = '2017' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2018' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2019' AND Team = 'Raptors' THEN 'champion'
			WHEN SEASON = '2020' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2021' AND Team = 'Bucks' THEN 'champion'
			WHEN SEASON = '2022' AND Team = 'Warriors' THEN 'champion'
			ELSE 'not champion' END AS championship_status
FROM rank_avg_fg_pct
),

-------------------------------------------------------------------------------------------------
--Average Free Throw Percentage


--Average free throw percentage by the home teams
average_ft_pct_HOME AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(FT_PCT_home) AS avg_ft_pct_HOME
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average free throw percentage by the visitor teams
average_ft_pct_AWAY AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(FT_PCT_away) AS avg_ft_pct_AWAY
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average free throw percentage COMBINING home and visitor percentage
average_ft_pct_COMBINE AS
(
	SELECT h.SEASON AS "SEASON"
			,h.GAME_TYPE AS "GAME_TYPE"
			,h.Home_Team AS Team
			,h.avg_ft_pct_HOME avg_ft_pct_HOME
			,a.avg_ft_pct_AWAY avg_ft_pct_AWAY
			,(avg_ft_pct_HOME + avg_ft_pct_AWAY)/2 AS Combination
	FROM average_ft_pct_HOME h
	FULL JOIN average_ft_pct_AWAY a
	ON h.Team = a.Team
),

rank_avg_ft_pct AS
(
SELECT *
		,RANK() OVER (
				PARTITION BY SEASON
				ORDER BY Combination DESC
		) avg_fg_pct_RANK
FROM average_ft_pct_COMBINE
),

champ_avg_ft_pct AS
(
SELECT *
	,CASE WHEN SEASON = '2004' AND Team = 'Pistons' THEN 'champion'
			WHEN SEASON = '2005' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2006' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2007' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2008' AND Team = 'Celtics' THEN 'champion'
			WHEN SEASON = '2009' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2010' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2011' AND Team = 'Mavericks' THEN 'champion'
			WHEN SEASON = '2012' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2013' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2014' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2015' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2016' AND Team = 'Cavaliers' THEN 'champion'
			WHEN SEASON = '2017' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2018' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2019' AND Team = 'Raptors' THEN 'champion'
			WHEN SEASON = '2020' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2021' AND Team = 'Bucks' THEN 'champion'
			WHEN SEASON = '2022' AND Team = 'Warriors' THEN 'champion'
			ELSE 'not champion' END AS championship_status
FROM rank_avg_ft_pct
),

-------------------------------------------------------------------------------------------------
--Average 3-Point Percentage


--Average 3-pt percentage by the home teams
average_fg3_pct_HOME AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(FG3_PCT_home) AS avg_fg3_pct_HOME
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average 3-pt percentage by the visitor teams
average_fg3_pct_AWAY AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(FG3_PCT_away) AS avg_fg3_pct_AWAY
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average 3-pt percentage COMBINING home and visitor percentage
average_fg3_pct_COMBINE AS
(
	SELECT h.SEASON AS "SEASON"
			,h.GAME_TYPE AS "GAME_TYPE"
			,h.Home_Team AS Team
			,h.avg_fg3_pct_HOME avg_fg3_pct_HOME
			,a.avg_fg3_pct_AWAY avg_fg3_pct_AWAY
			,(avg_fg3_pct_HOME + avg_fg3_pct_AWAY)/2 AS Combination
	FROM average_fg3_pct_HOME h
	FULL JOIN average_fg3_pct_AWAY a
	ON h.Team = a.Team
),

rank_avg_fg3_pct AS
(
SELECT *
		,RANK() OVER (
				PARTITION BY SEASON
				ORDER BY Combination DESC
		) avg_fg3_pct_RANK
FROM average_fg3_pct_COMBINE
),

champ_avg_fg3_pct AS
(
SELECT *
	,CASE WHEN SEASON = '2004' AND Team = 'Pistons' THEN 'champion'
			WHEN SEASON = '2005' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2006' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2007' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2008' AND Team = 'Celtics' THEN 'champion'
			WHEN SEASON = '2009' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2010' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2011' AND Team = 'Mavericks' THEN 'champion'
			WHEN SEASON = '2012' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2013' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2014' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2015' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2016' AND Team = 'Cavaliers' THEN 'champion'
			WHEN SEASON = '2017' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2018' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2019' AND Team = 'Raptors' THEN 'champion'
			WHEN SEASON = '2020' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2021' AND Team = 'Bucks' THEN 'champion'
			WHEN SEASON = '2022' AND Team = 'Warriors' THEN 'champion'
			ELSE 'not champion' END AS championship_status
FROM rank_avg_fg3_pct
),

-------------------------------------------------------------------------------------------------
--Average assists

--Average assists by the home teams
average_ast_HOME AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(AST_home) AS avg_ast_HOME
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average assists by the visitor teams
average_ast_AWAY AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(AST_away) AS avg_ast_AWAY
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average assists COMBINING home and visitor percentage
average_ast_COMBINE AS
(
	SELECT h.SEASON AS "SEASON"
			,h.GAME_TYPE AS "GAME_TYPE"
			,h.Home_Team AS Team
			,h.avg_ast_HOME avg_ast_HOME
			,a.avg_ast_AWAY avg_ast_AWAY
			,(avg_ast_HOME + avg_ast_AWAY)/2 AS Combination
	FROM average_ast_HOME h
	FULL JOIN average_ast_AWAY a
	ON h.Team = a.Team
),

rank_avg_ast AS
(
SELECT *
		,RANK() OVER (
				PARTITION BY SEASON
				ORDER BY Combination DESC
		) avg_ast_RANK
FROM average_ast_COMBINE
),

champ_avg_ast AS
(
SELECT *
	,CASE WHEN SEASON = '2004' AND Team = 'Pistons' THEN 'champion'
			WHEN SEASON = '2005' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2006' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2007' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2008' AND Team = 'Celtics' THEN 'champion'
			WHEN SEASON = '2009' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2010' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2011' AND Team = 'Mavericks' THEN 'champion'
			WHEN SEASON = '2012' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2013' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2014' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2015' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2016' AND Team = 'Cavaliers' THEN 'champion'
			WHEN SEASON = '2017' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2018' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2019' AND Team = 'Raptors' THEN 'champion'
			WHEN SEASON = '2020' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2021' AND Team = 'Bucks' THEN 'champion'
			WHEN SEASON = '2022' AND Team = 'Warriors' THEN 'champion'
			ELSE 'not champion' END AS championship_status
FROM rank_avg_ast
),

-------------------------------------------------------------------------------------------------
--Average rebounds


--Average rebounds by the home teams
average_reb_HOME AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(REB_home) AS avg_reb_HOME
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average rebounds by the visitor teams
average_reb_AWAY AS
(
	SELECT SEASON
			,GAME_TYPE
			,Home_Team
			,CAST(SEASON AS varchar) + ' ' + GAME_TYPE + ' ' + Home_Team AS Team
			,AVG(REB_away) AS avg_reb_AWAY
	FROM teams_AWAY
	WHERE GAME_TYPE = 'Regular Season'
	GROUP BY SEASON, GAME_TYPE, Home_Team
),

--Average rebounds COMBINING home and visitor percentage
average_reb_COMBINE AS
(
	SELECT h.SEASON AS "SEASON"
			,h.GAME_TYPE AS "GAME_TYPE"
			,h.Home_Team AS Team
			,h.avg_reb_HOME avg_reb_HOME
			,a.avg_reb_AWAY avg_reb_AWAY
			,(avg_reb_HOME + avg_reb_AWAY)/2 AS Combination
	FROM average_reb_HOME h
	FULL JOIN average_reb_AWAY a
	ON h.Team = a.Team
),

rank_avg_reb AS
(
SELECT *
		,RANK() OVER (
				PARTITION BY SEASON
				ORDER BY Combination DESC
		) avg_reb_RANK
FROM average_reb_COMBINE
),

champ_avg_reb AS
(
SELECT *
	,CASE WHEN SEASON = '2004' AND Team = 'Pistons' THEN 'champion'
			WHEN SEASON = '2005' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2006' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2007' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2008' AND Team = 'Celtics' THEN 'champion'
			WHEN SEASON = '2009' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2010' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2011' AND Team = 'Mavericks' THEN 'champion'
			WHEN SEASON = '2012' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2013' AND Team = 'Heat' THEN 'champion'
			WHEN SEASON = '2014' AND Team = 'Spurs' THEN 'champion'
			WHEN SEASON = '2015' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2016' AND Team = 'Cavaliers' THEN 'champion'
			WHEN SEASON = '2017' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2018' AND Team = 'Warriors' THEN 'champion'
			WHEN SEASON = '2019' AND Team = 'Raptors' THEN 'champion'
			WHEN SEASON = '2020' AND Team = 'Lakers' THEN 'champion'
			WHEN SEASON = '2021' AND Team = 'Bucks' THEN 'champion'
			WHEN SEASON = '2022' AND Team = 'Warriors' THEN 'champion'
			ELSE 'not champion' END AS championship_status
FROM rank_avg_reb
)

SELECT *
FROM champ_avg_reb
WHERE championship_status = 'champion'
ORDER BY SEASON