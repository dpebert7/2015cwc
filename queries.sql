/*
 Example SQL queries for the 2015 Cricket World Cup database:
*/

"""
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


-- What venues were used by South Africa? (ID = 3)
SELECT matches.ground_id, grounds.town_name
FROM matches
JOIN grounds
ON matches.ground_id = grounds.ground_id
WHERE team_1_id = 3 OR team_2_id = 3


-- Who refereed each match?
SELECT matches.match_title, matches.referee, officials.name
FROM matches
JOIN officials
ON matches.referee = officials.official_id;


-- What venues hosted the knockout matches?
SELECT matches.match_title, grounds.ground_name
FROM matches
JOIN grounds
ON grounds.ground_id = matches.ground_id
WHERE matches.match_title LIKE '%Final';


-- How many matches were hosted at each venue?
SELECT grounds.ground_name, count(*) AS 'matches_hosted'
FROM matches
JOIN grounds
ON grounds.ground_id = matches.ground_id
GROUP BY grounds.ground_name
ORDER BY matches_hosted DESC, ground_name;


-- Which teams won the most matches? (Include teams that didn't win at all)
SELECT teams.team_abbreviation, count(matches.match_winner) AS 'wins'
FROM teams
LEFT JOIN matches
ON matches.match_winner = teams.team_abbreviation
GROUP BY matches.match_winner
ORDER BY wins DESC;
-- Why does SCOT show up but not UAE?


-- The team winning the toss won about 52% of the matches.
-- The team batting first won half of the matches.
SELECT 
-- matches.match_winner, teams.team_abbreviation AS 'toss_winner', matches.batting_first
AVG(matches.match_winner = teams.team_abbreviation) 'toss_win_pct',
AVG(matches.match_winner = matches.batting_first) AS 'batting_first_win_pct'
FROM matches
JOIN teams
ON matches.toss_winner = teams.team_id;


-- Display two teams competing in each match 
SELECT
matches.match_title,
matches.date,
teamone.team_abbreviation,
teamtwo.team_abbreviation
FROM matches
JOIN teams teamone ON (matches.team_1_id = teamone.team_id)
JOIN teams teamtwo ON (matches.team_2_id = teamtwo.team_id);


-- List all 5 officials for each match. Several joins needed!
SELECT
matches.match_title,
matches.date,
ref.name AS referee,
res.name AS reserve_umpire,
tv.name AS tv_umpire,
u1.name AS umpire_1,
u2.name AS umpire_2
FROM matches
JOIN officials ref ON (matches.referee = ref.official_id)
JOIN officials res ON (matches.reserve_umpire = res.official_id)
JOIN officials tv ON (matches.tv_umpire = tv.official_id)
JOIN officials u1 ON (matches.umpire_1_id = u1.official_id)
JOIN officials u2 ON (matches.umpire_2_id = u2.official_id);


-- Show captains from both teams for each match
SELECT
t1.player_name, 
t2.player_name,
matches.result,
matches.match_title
FROM matches
JOIN players t1 ON (t1.player_id = matches.team_1_captain)
JOIN players t2 ON (t2.player_id = matches.team_2_captain)


-- Check that team_1_next_match is working correctly
SELECT first.match_id as 'first_match_id', 
first.team_1_id as 'team_id',  
first.team_1_next_match as 'team_next_match_id', 
second.team_1_id as 'next_match_team_1', 
second.team_2_id as 'next_match_team_2'
FROM matches first
JOIN matches second
ON (first.team_1_next_match = second.match_id)


-- Check that team_2_next_match is working correctly
SELECT 
first.match_id as 'first_match_id', 
first.team_2_id as 'team_id',  
first.team_2_next_match as 'team_next_match_id', 
second.team_1_id as 'next_match_team_1', 
second.team_2_id as 'next_match_team_2'
FROM matches first
JOIN matches second
ON (first.team_2_next_match = second.match_id)
"""
