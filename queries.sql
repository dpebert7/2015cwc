/*
 Example SQL queries for the 2015 Cricket World Cup database:
*/

-- Check number of rows from each table:
SELECT COUNT(*) from grounds;
SELECT COUNT(*) from matches;
SELECT COUNT(*) from officials;
SELECT COUNT(*) from players;
SELECT COUNT(*) from teams;



-- Number of players used by each team
SELECT COUNT(*), teams.team_abbreviation
FROM players
	INNER JOIN teams
	ON players.team_id=teams.team_id
	GROUP BY team_abbreviation;



-- What venues were used by South Africa? (GIVEN: ID = 3)
SELECT 
    ROW_NUMBER() OVER (ORDER BY matches.match_id) match_number,
    matches.ground_id, 
    grounds.town_name, 
    grounds.ground_name
FROM matches
    LEFT JOIN grounds
    ON matches.ground_id = grounds.ground_id
    WHERE team_1_id = 3 OR team_2_id = 3
    ORDER BY matches.match_id;



-- Show match titles, venues, opponents, captains, and match result for all 8 of South Africa's matches:
SELECT 
    ROW_NUMBER() OVER (ORDER BY matches.match_id) match_number,
    matches.match_title,
    grounds.ground_name,
    t1.team_abbreviation team_1,
    p1.player_name AS team_1_captain,
    t2.team_abbreviation team_2,
    p2.player_name AS team_2_captain,
    matches.match_result,
    matches.match_winner,
    CASE WHEN matches.match_winner = 'SA' THEN 'Win!!' ELSE 'Lose :(' END AS win_or_lose
FROM matches
    JOIN grounds ON (matches.ground_id = grounds.ground_id)
    JOIN teams t1 ON (matches.team_1_id = t1.team_id)
    JOIN teams t2 ON (matches.team_2_id = t2.team_id)
    JOIN players p1 ON (matches.team_1_captain = p1.player_id)
    JOIN players p2 ON (matches.team_2_captain = p2.player_id)
    WHERE t1.team_abbreviation = 'SA' OR t2.team_abbreviation = 'SA'
    ORDER BY match_number;



-- What venues hosted the knockout matches?
SELECT matches.match_title, grounds.ground_name
FROM matches
    JOIN grounds
    ON grounds.ground_id = matches.ground_id
    WHERE matches.match_title LIKE '%Final';



-- How many matches were hosted at each venue?
SELECT grounds.ground_name, count(*) AS matches_hosted
FROM matches
    JOIN grounds
    ON grounds.ground_id = matches.ground_id
    GROUP BY grounds.ground_name
    ORDER BY matches_hosted DESC, ground_name;



-- Check that team_1_next_match is working correctly
SELECT 
    first.match_id AS first_match_id, 
    first.team_1_id AS team_id,  
    first.team_1_next_match AS team_next_match_id, 
    second.team_1_id AS next_match_team_1, 
    second.team_2_id AS next_match_team_2
FROM matches first
    JOIN matches second
    ON (first.team_1_next_match = second.match_id)



-- Show captains from both teams for each match
SELECT
    t1.player_name, 
    t2.player_name,
    matches.match_result,
    matches.match_title
FROM matches
    JOIN players t1 ON (t1.player_id = matches.team_1_captain)
    JOIN players t2 ON (t2.player_id = matches.team_2_captain)



-- Display two teams competing in each match 
SELECT
    matches.match_title,
    matches.match_date,
    teamone.team_abbreviation,
    teamtwo.team_abbreviation
FROM matches
    JOIN teams teamone ON (matches.team_1_id = teamone.team_id)
    JOIN teams teamtwo ON (matches.team_2_id = teamtwo.team_id);



-- List all 5 officials for each match. Several joins needed!
SELECT UNIQUE 	--I'm not sure why, but duplicate rows seem to appear without the "UNIQUE" included here.
		-- Do I need a different kind of join, like an inner join?
    matches.match_title,
    matches.match_date,
    refe.name AS referee,
    res.name AS reserve_umpire,
    tv.name AS tv_umpire,
    u1.name AS umpire_1,
    u2.name AS umpire_2
FROM matches
    JOIN officials refe ON (matches.referee = refe.official_id)
    JOIN officials res ON (matches.reserve_umpire = res.official_id)
    JOIN officials tv ON (matches.tv_umpire = tv.official_id)
    JOIN officials u1 ON (matches.umpire_1_id = u1.official_id)
    JOIN officials u2 ON (matches.umpire_2_id = u2.official_id)
    ORDER BY match_date;



-- How often did the team that won the toss win the match?
SELECT 
   AVG(CASE WHEN matches.match_winner=teams.team_abbreviation THEN 1 ELSE 0 END) AS toss_winner_win_pct, 
   COUNT(*) AS num_matches
FROM teams
    LEFT JOIN matches ON (matches.toss_winner = teams.team_id);
-- The team winning the toss won 52% of the matches.



-- How often did the team batting first win the match?
SELECT AVG(CASE WHEN batting_first=match_winner THEN 1 ELSE 0 END) AS batting_first_win_pct, 
    COUNT(*) 
FROM matches;
-- The team batting first won (exactly!) half of the time.



-- Which teams won the most matches? (Include teams that didn't win at all)
SELECT teams.team_abbreviation, COUNT(matches.match_winner) AS wins
    FROM teams
    LEFT JOIN matches ON (matches.match_winner = teams.team_abbreviation)
        GROUP BY teams.team_abbreviation
        ORDER BY wins DESC;





