# -*- coding: utf-8 -*-
"""
Created on Sat Oct 15 16:35:36 2016

@author: david
"""

############
# Setup
############

import os
import pandas as pd
import sqlite3
import MySQLdb  # It works from command line, but not here.

os.chdir('/home/david/Desktop/Documents/GitRepos/python-espncricinfo')
os.listdir()




############
# Basic tests
############

# Get this module from https://github.com/dwillis/python-espncricinfo

from espncricinfo.summary import Summary
s = Summary()
s.match_ids

from espncricinfo.match import Match
m = Match('64148')
m.description




############
# Import 49 matches from 2015 world cup; create big, clunky match_df
############

from match_ids import match_ids

match_data = {}
for i in match_ids:
	m = Match(i)
	match_data[i]=m
	print(i)


'''       
MORE ATTRIBUTES NOT USED:    
date
present_datetime_local
present_datetime_gmt
weather_location_code
start_datetime_local
start_datetime_gmt
scheduled_overs
innings_list
innings
latest_batting
latest_bowling
latest_innings
latest_innings_fow
'''



############
# Set pandas display
############

pd.set_option('display.max_rows', 20)
pd.set_option('display.max_columns', 10)
pd.set_option('display.width', 1000)
pd.set_option('display.max_colwidth', -1)



############
# Explore bunches of junk available in match_data
############

bunch_of_stuff_df = pd.DataFrame({
# Match id
'id'                    : match_ids,

# General Team Info
'team_1_id'             : [i.team_1_id for i in match_data.values()],
'team_2_id'             : [i.team_2_id for i in match_data.values()],
'team_1_abbreviation'   : [i.team_1_abbreviation for i in match_data.values()],
'team_2_abbreviation'   : [i.team_2_abbreviation for i in match_data.values()],

'match_title'           : [i.match_title for i in match_data.values()],
'description'           : [i.description for i in match_data.values()],
'series'                : [i.series for i in match_data.values()],

# Ground Info
'ground_id'             : [i.ground_id for i in match_data.values()],   
'ground_name'           : [i.ground_name for i in match_data.values()],
'continent'             : [i.continent for i in match_data.values()],
'town_area'             : [i.town_area for i in match_data.values()],
'town_name'             : [i.town_name for i in match_data.values()],
'town_id'               : [i.town_id for i in match_data.values()],

# Officials Info
'officials'             : [i.officials for i in match_data.values()], #Lots here!

# Match Timing
'lighting'              : [i.lighting for i in match_data.values()],

# Toss Info
'batting_first'         : [i.batting_first for i in match_data.values()],
'home_team'             : [i.home_team for i in match_data.values()],
'toss_winner'           : [i.toss_winner for i in match_data.values()],

# Players Info
'team_1_players'        : [i.team_1_players for i in match_data.values()],  #11 players from team 1
'team_2_players'        : [i.team_2_players for i in match_data.values()],  #11 players from team 2

# Match result
'team_1_innings'        : [i.team_1_innings for i in match_data.values()],
'team_1_run_rate'       : [i.team_1_run_rate for i in match_data.values()],
'team_1_overs_batted'   : [i.team_1_overs_batted for i in match_data.values()],
'team_1_batting_result' : [i.team_1_batting_result for i in match_data.values()],
'team_2_innings'        : [i.team_2_innings for i in match_data.values()],
'team_2_run_rate'       : [i.team_2_run_rate for i in match_data.values()],
'team_2_overs_batted'   : [i.team_2_overs_batted for i in match_data.values()],
'team_2_batting_result' : [i.team_2_batting_result for i in match_data.values()],
'match_winner'          : [i.match_winner for i in match_data.values()],
'result'                : [i.result for i in match_data.values()], # Text description
'rain_rule'             : [i.rain_rule for i in match_data.values()], #Includes D/L results
'series'                : [i.series for i in match_data.values()], #Interesting!


#JUNK
'weather_location_code' : [i.weather_location_code for i in match_data.values()], # Country and number

'cancelled_match'       : [i.cancelled_match for i in match_data.values()], #False for all matches
'current_summary'       : [i.current_summary for i in match_data.values()], #None for all matches
'followon'              : [i.followon for i in match_data.values()], #False for all matches      
'status'                : [i.status for i in match_data.values()], #completed for all matches
'match_class'           : [i.match_class for i in match_data.values()], #ODI for all matches
'season'                : [i.season for i in match_data.values()], #2014/15 for all matches
'team_1'                : [i.team_1 for i in match_data.values()], #24 attributes from team 1
'team_2'                : [i.team_2 for i in match_data.values()]  #24 attributes from team 2
    #attributes include generic team info and 11 players IDENTICAL to 'team_1_players'

})


bunch_of_stuff_df[['ground_id','ground_name', 'team_2_id','team_2_abbreviation']] 
    # This will be the basis for the players_df table

bunch_of_stuff_df[['ground_id','ground_name']] 
    # This will be the basis for the ground_df table

bunch_of_stuff_df[['team_1']]
    # Lots of info here

bunch_of_stuff_df[['team_1_innings', 'team_1_run_rate', 'team_1_overs_batted', 
          'team_1_batting_result', 'match_winner']]
    # Some info about match result

bunch_of_stuff_df[['batting_first']]



############
# main match_df data frame
############

match_df = pd.DataFrame({
# Match id
'match_id'              : match_ids,

# Teams and captains
'team_1_id'             : [i.team_1_id for i in match_data.values()],
'team_2_id'             : [i.team_2_id for i in match_data.values()],
'team_1_captain'        : [i.team_1_players[j]['player_id']                         
                        for i in match_data.values()
                        for j in range(10)                        
                        if i.team_1_players[j]['captain']=='1'],

'team_2_captain'        : [i.team_2_players[j]['player_id'] 
                        for i in match_data.values()
                        for j in range(10)
                        if i.team_2_players[j]['captain']=='1'],

'match_title'           : [i.match_title for i in match_data.values()],
#'description'           : [i.description for i in match_data.values()],

# Ground
'ground_id'             : [i.ground_id for i in match_data.values()],   

# Officials Info  <- Fix this!
#'officials'             : [i.officials for i in match_data.values()], #Lots here!

# Toss and Timing Information
'lighting'              : [i.lighting for i in match_data.values()],
'batting_first'         : [i.batting_first for i in match_data.values()],
'home_team'             : [i.home_team for i in match_data.values()],
'toss_winner'           : [i.toss_winner for i in match_data.values()],
'date'                  : [i.date for i in match_data.values()],

# Match result
#'team_1_innings'        : [i.team_1_innings for i in match_data.values()],
'team_1_run_rate'       : [i.team_1_run_rate for i in match_data.values()],
'team_1_overs_batted'   : [i.team_1_overs_batted for i in match_data.values()],
'team_1_batting_result' : [i.team_1_batting_result for i in match_data.values()],
#'team_2_innings'        : [i.team_2_innings for i in match_data.values()],
'team_2_run_rate'       : [i.team_2_run_rate for i in match_data.values()],
'team_2_overs_batted'   : [i.team_2_overs_batted for i in match_data.values()],
'team_2_batting_result' : [i.team_2_batting_result for i in match_data.values()],
'match_winner'          : [i.match_winner for i in match_data.values()],
'result'                : [i.result for i in match_data.values()], # Text description
'rain_rule'             : [i.rain_rule for i in match_data.values()], #Includes D/L results
'status'                : [i.status for i in match_data.values()] #completed for all matches
})


# Append match_officials to match_df

match_officials = [[match_data[x].officials[i]['object_id'] for i in range(5)] for x in match_ids]
match_officials = [[match_ids[i]] + match_officials[i] for i in range(len(match_officials))]

match_officials_df = pd.DataFrame({     
'umpire_1_id'       : [match_officials[i][1] for i in range(len(match_officials))],
'umpire_2_id'       : [match_officials[i][2] for i in range(len(match_officials))],
'tv_umpire'         : [match_officials[i][3] for i in range(len(match_officials))],
'referee'           : [match_officials[i][4] for i in range(len(match_officials))],
'reserve_umpire'    : [match_officials[i][5] for i in range(len(match_officials))]})

match_df = pd.concat([match_df, match_officials_df], axis=1)


# Append team_1_next_match and team_2_next_match to match_df

team_ids = team_df[['team_id']].astype(float) # This isn't working
team_ids = ['1','2','3','4','5','6','7','8','9','25','27','29','30','40'] # Lame fix! Grrr
list(match_df["match_id"][(match_df["team_1_id"] == '2') | 
                                    (match_df["team_2_id"] == '2')]) #list all match ids for each team

next_match = {i : list(match_df["match_id"][(match_df["team_1_id"] == i) | 
                                    (match_df["team_2_id"] == i)]) for i in team_ids}

def find_next_match(match_id,team_id):
    idx = next_match[team_id].index(match_id)
    if (idx+1)<len(next_match[team_id]):
        return next_match[team_id][idx+1]
    else:
        return 'NULL'

find_next_match(656467, '30') # test works
find_next_match(656477, '30') # test works

match_df[['match_id','team_1_id']]
match_df['team_1_id'][('match_id' == 656467)]

team_id = match_df["team_1_id"][(match_df["match_id"] == 656467)]  # <--- Fix this so it ONLY returns team_id and not other junk
find_next_match(656467,team_id)

team_1_next_match = []
team_2_next_match = []
#for i in match_df['match_id']:
for i in range(48):
    print(i)
    #team_1_id = match_df[(match_df["match_id"] == i)]["team_1_id"]  # <--- Fix this !!!
    #team_2_id = match_df[(match_df["match_id"] == i)]["team_2_id"][0]  # <--- Fix this !!!
    team_1_id = match_df["team_1_id"][i]
    team_2_id = match_df["team_2_id"][i]
    match_id = match_df["match_id"][i]
    team_1_next_match.append(str(find_next_match(match_id,team_1_id)))
    team_2_next_match.append(str(find_next_match(match_id,team_2_id)))


match_df['team_1_next_match'] = team_1_next_match
match_df['team_2_next_match'] = team_2_next_match



############
# Create team_df table showing team_id and team_abbreviation
############

team_df_1 = bunch_of_stuff_df[['team_1_id','team_1_abbreviation']]
team_df_2 = bunch_of_stuff_df[['team_2_id','team_2_abbreviation']]

team_df_1 = team_df_1.rename(index=str, 
            columns={"team_1_id": "team_id", "team_1_abbreviation": "team_abbreviation"})
team_df_2 = team_df_2.rename(index=str, 
            columns={"team_2_id": "team_id", "team_2_abbreviation": "team_abbreviation"})
team_df = team_df_1.append(team_df_2, ignore_index = True).drop_duplicates()

team_df[['team_id']] = team_df[['team_id']].astype(float)
team_df = team_df.sort('team_id')
team_df[['team_id']] = team_df[['team_id']].astype(object)
team_df.dtypes




############
# Create ground_df table showing ground_id and other info
############
ground_df = bunch_of_stuff_df[['ground_id','ground_name', 'continent', 
                      'town_area', 'town_name', 'town_id']].drop_duplicates()




############
# Create officials_df table showing officials for each game
############
officials_df = pd.DataFrame({
'official_id'       : [match_data[x].officials[i]['object_id'] for i in range(4) for x in match_ids],
'name'              : [match_data[x].officials[i]['known_as'] for i in range(4) for x in match_ids],
'dob'               : [match_data[x].officials[i]['dob'] for i in range(4) for x in match_ids],
'age_years'         : [match_data[x].officials[i]['age_years'] for i in range(4) for x in match_ids], 
    #Note this is the age at time of first match in competition
'team_name'         : [match_data[x].officials[i]['team_name'] for i in range(4) for x in match_ids]
}).drop_duplicates()





############
# Create players_df table listing all players
############

team_id = [
match_data[x].team_1_id 
                for i in range(11) for x in match_ids] + [
match_data[x].team_2_id
                for i in range(11) for x in match_ids]

player_id  = [
match_data[x].team_1_players[i]['player_id'] 
                for i in range(11) for x in match_ids] + [
match_data[x].team_2_players[i]['player_id'] 
                for i in range(11) for x in match_ids]

player_name  = [
match_data[x].team_1_players[i]['known_as'] 
                for i in range(11) for x in match_ids] + [
match_data[x].team_2_players[i]['known_as'] 
                for i in range(11) for x in match_ids]

dob  = [
match_data[x].team_1_players[i]['dob'] 
                for i in range(11) for x in match_ids] + [
match_data[x].team_2_players[i]['dob'] 
                for i in range(11) for x in match_ids]
                    
age_years  = [
match_data[x].team_1_players[i]['age_years'] 
                for i in range(11) for x in match_ids] + [
match_data[x].team_2_players[i]['age_years'] 
                for i in range(11) for x in match_ids]
                    
player_primary_role  = [
match_data[x].team_1_players[i]['player_primary_role'] 
                for i in range(11) for x in match_ids] + [
match_data[x].team_2_players[i]['player_primary_role'] 
                for i in range(11) for x in match_ids]


players_df = pd.DataFrame({     
'player_id'             : player_id,
'team_id'               : team_id,
'player_name'           : player_name,
'dob'                   : dob,
'player_primary_role'   : player_primary_role
}).drop_duplicates()



############
# Create database
############

conn = sqlite3.connect("cwc.sqlite")
match_df.to_sql(name='matches', con=conn, if_exists = 'replace')
team_df.to_sql(name='teams', con=conn, if_exists = 'replace')
officials_df.to_sql(name='officials', con=conn, if_exists = 'replace')
players_df.to_sql(name='players', con=conn, if_exists = 'replace')
ground_df.to_sql(name='grounds', con=conn, if_exists = 'replace')
conn.close()

