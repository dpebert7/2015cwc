/*

This SQL script creates a schema for matches, players, teams, coaches and venues of the 2015 Cricket World Cup. It is intended for use in Oracle Live SQL.

Due to the size of the file, it is best to upload half of it at a time.

Questions:
1) Remove '"index" INTEGER' from each table?
2) Include previous match in matches table
3) Include additional rows for matches table - esp results
4) Check data types, esp for date

*/

-- Table Setup

DROP TABLE IF EXISTS "matches";
CREATE TABLE "matches" (
"index" INTEGER,
  "batting_first" VARCHAR(100),
  "date" VARCHAR(100),
  "ground_id" VARCHAR(100),
  "home_team" VARCHAR(100),
  "lighting" VARCHAR(100),
  "match_id" VARCHAR(100),
  "match_title" VARCHAR(100),
  "match_winner" VARCHAR(100),
  "rain_rule" VARCHAR(100),
  "result" VARCHAR(100),
  "status" VARCHAR(100),
  "team_1_batting_result" VARCHAR(100),
  "team_1_captain" VARCHAR(100),
  "team_1_id" VARCHAR(100),
  "team_1_overs_batted" VARCHAR(100),
  "team_1_run_rate" VARCHAR(100),
  "team_2_batting_result" VARCHAR(100),
  "team_2_captain" VARCHAR(100),
  "team_2_id" VARCHAR(100),
  "team_2_overs_batted" VARCHAR(100),
  "team_2_run_rate" VARCHAR(100),
  "toss_winner" VARCHAR(100),
  "referee" VARCHAR(100),
  "reserve_umpire" VARCHAR(100),
  "tv_umpire" VARCHAR(100),
  "umpire_1_id" VARCHAR(100),
  "umpire_2_id" VARCHAR(100),
  "team_1_next_match" VARCHAR(100),
  "team_2_next_match" VARCHAR(100)
);

DROP TABLE IF EXISTS "grounds";
CREATE TABLE "grounds" (
"index" INTEGER,
  "ground_id" VARCHAR(100),
  "ground_name" VARCHAR(100),
  "continent" VARCHAR(100),
  "town_area" VARCHAR(100),
  "town_name" VARCHAR(100),
  "town_id" VARCHAR(100)
);

DROP TABLE IF EXISTS "officials";
CREATE TABLE "officials" (
"index" INTEGER,
  "age_years" VARCHAR(100),
  "dob" VARCHAR(100),
  "name" VARCHAR(100),
  "official_id" VARCHAR(100),
  "team_name" VARCHAR(100)
);

DROP TABLE IF EXISTS "players";
CREATE TABLE "players" (
"index" INTEGER,
  "dob" VARCHAR(100),
  "player_id" VARCHAR(100),
  "player_name" VARCHAR(100),
  "player_primary_role" VARCHAR(100),
  "team_id" VARCHAR(100)
);

DROP TABLE IF EXISTS "teams";
CREATE TABLE "teams" (
"index" INTEGER,
  "team_id" VARCHAR(100),
  "team_abbreviation" VARCHAR(100)
);


-- Insert Data

INSERT INTO "matches" VALUES(0,'NZ','2015-02-14','93','NZ','day match',656399,'1st Match, Pool A','NZ',NULL,'New Zealand won by 98 runs','complete','complete','10384','5',50,6.62,'all out','47023','8',46.1,5.04,'8','4169','5341','33135','44971','16314','656409','656421');
INSERT INTO "matches" VALUES(1,'AUS','2015-02-14','61','AUS','day/night match',656401,'2nd Match, Pool A','AUS',NULL,'Australia won by 111 runs','complete','complete','35384','2',50,6.84,'all out','47055','1',41.5,5.52,'1','36620','387601','36339','39157','48469','656437','656415');
INSERT INTO "matches" VALUES(2,'SA','2015-02-15','504','ZIM','day/night match',656403,'3rd Match, Pool B','SA',NULL,'South Africa won by 62 runs','complete','complete','46533','3',50,6.78,'all out','45252','9',48.2,5.73,'9','49626','50159','7326','49665','7986','656423','656413');
INSERT INTO "matches" VALUES(3,'INDIA','2015-02-15','131','PAK','day/night match',656405,'4th Match, Pool B','INDIA',NULL,'India won by 76 runs','complete','complete','7593','6',50,6,'all out','19596','7',47,4.76,'6','49623','13413','4922','13414','15872','656423','656417');
INSERT INTO "matches" VALUES(4,'WI','2015-02-16','2480','WI','day match',656407,'5th Match, Pool B','IRE',NULL,'Ireland won by 4 wickets (with 25 balls remaining)','complete','target reached','47403','29',45.5,6.69,'complete','59339','4',50,6.08,'29','9230','44449','37097','15383','7029','656429','656417');
INSERT INTO "matches" VALUES(5,'SCOT','2015-02-17','769','NZ','day match',656409,'6th Match, Pool A','NZ',NULL,'New Zealand won by 3 wickets (with 151 balls remaining)','complete','target reached','10384','5',24.5,5.87,'all out','62583','30',36.2,3.9,'5','4169','33135','44971','5341','16314','656415','656425');
INSERT INTO "matches" VALUES(6,'BDESH','2015-02-18','757','BDESH','day/night match',656411,'7th Match, Pool A','BDESH',NULL,'Bangladesh won by 105 runs','complete','all out','46888','40',42.5,3.78,'all out','24672','25',50,5.34,'25','36620','15872','39157','4922','387601','656421','656433');
INSERT INTO "matches" VALUES(7,'UAE','2015-02-19','2480','ZIM','day match',656413,'8th Match, Pool B','ZIM',NULL,'Zimbabwe won by 4 wickets (with 12 balls remaining)','complete','complete','47712','27',50,5.7,'target reached','45252','9',48,5.95,'9','9230','49665','15383','44449','37097','656429','656427');
INSERT INTO "matches" VALUES(8,'ENG','2015-02-20','1166','NZ','day/night match',656415,'9th Match, Pool A','NZ',NULL,'New Zealand won by 8 wickets (with 226 balls remaining)','complete','target reached','10384','5',12.2,10.13,'all out','47055','1',33.2,3.69,'1','49626','50159','7029','7326','7986','656437','656425');
INSERT INTO "matches" VALUES(9,'WI','2015-02-21','93','WI','day match',656417,'10th Match, Pool B','WI',NULL,'West Indies won by 150 runs','complete','all out','19596','7',39,4.1,'complete','59339','4',50,6.2,'7','4169','5341','33135','44971','16314','656443','656427');
INSERT INTO "matches" VALUES(10,'AFG','2015-02-22','769','SL','day match',656421,'12th Match, Pool A','SL',NULL,'Sri Lanka won by 4 wickets (with 10 balls remaining)','complete','all out','46888','40',49.4,4.67,'target reached','47023','8',48.2,4.88,'8','9230','7029','44449','37097','15383','656431','656433');
INSERT INTO "matches" VALUES(11,'INDIA','2015-02-22','61','SA','day/night match',656423,'13th Match, Pool B','INDIA',NULL,'India won by 130 runs','complete','complete','7593','6',50,6.14,'all out','46533','3',40.2,4.38,'6','36620','387601','4922','39157','15872','656439','656435');
INSERT INTO "matches" VALUES(12,'ENG','2015-02-23','93','SCOT','day match',656425,'14th Match, Pool A','ENG',NULL,'England won by 119 runs','complete','complete','47055','1',50,6.06,'all out','62583','30',42.2,4.34,'30','4169','7326','44971','33135','7986','656441','656431');
INSERT INTO "matches" VALUES(13,'WI','2015-02-24','757','ZIM','day/night match',656427,'15th Match, Pool B','WI','D/L method','West Indies won by 73 runs (D/L method)','complete','complete','59339','4',50,7.44,'all out','45252','9',44.3,6.49,'4','49626','15872','49665','4922','13414','656435','656443');
INSERT INTO "matches" VALUES(14,'UAE','2015-02-25','209','UAE','day/night match',656429,'16th Match, Pool B','IRE',NULL,'Ireland won by 2 wickets (with 4 balls remaining)','complete','target reached','47403','29',49.2,5.65,'complete','47712','27',50,5.56,'29','49623','36339','48469','13413','16314','656445','656439');
INSERT INTO "matches" VALUES(15,'SCOT','2015-02-26','769','SCOT','day match',656431,'17th Match, Pool A','AFG',NULL,'Afghanistan won by 1 wicket (with 3 balls remaining)','complete','target reached','46888','40',49.3,4.26,'all out','62583','30',50,4.2,'40','4169','37097','7986','5341','50159','656449','656451');
INSERT INTO "matches" VALUES(16,'SL','2015-02-26','61','SL','day/night match',656433,'18th Match, Pool A','SL',NULL,'Sri Lanka won by 92 runs','complete','all out','24672','25',47,5.1,'complete','47023','8',50,6.64,'8','36620','387601','15872','39157','7326','656451','656441');
INSERT INTO "matches" VALUES(17,'SA','2015-02-27','132','WI','day/night match',656435,'19th Match, Pool B','SA',NULL,'South Africa won by 257 runs','complete','complete','46533','3',50,8.16,'all out','59339','4',33.1,4.55,'3','49626','39157','49665','4922','13414','656445','656453');
INSERT INTO "matches" VALUES(18,'AUS','2015-02-28','283','NZ','day/night match',656437,'20th Match, Pool A','NZ',NULL,'New Zealand won by 1 wicket (with 161 balls remaining)','complete','target reached','10384','5',23.1,6.56,'all out','8876','2',32.2,4.67,'2','9230','44449','33135','44971','15383','656459','656449');
INSERT INTO "matches" VALUES(19,'UAE','2015-02-28','213','UAE','day/night match',656439,'21st Match, Pool B','INDIA',NULL,'India won by 9 wickets (with 187 balls remaining)','complete','target reached','7593','6',18.5,5.52,'all out','47712','27',31.3,3.23,'27','49623','48469','16314','36339','13413','656453','656447');
INSERT INTO "matches" VALUES(20,'ENG','2015-03-01','1166','SL','day match',656441,'22nd Match, Pool A','SL',NULL,'Sri Lanka won by 9 wickets (with 16 balls remaining)','complete','complete','47055','1',50,6.18,'target reached','47023','8',47.2,6.59,'1','4169','5341','37097','7029','7986','656463','656461');
INSERT INTO "matches" VALUES(21,'PAK','2015-03-01','209','ZIM','day/night match',656443,'23rd Match, Pool B','PAK',NULL,'Pakistan won by 20 runs','complete','complete','19596','7',50,4.7,'all out','45252','9',49.4,4.32,'7','36620','50159','7326','15872','387601','656447','656457');
INSERT INTO "matches" VALUES(22,'SA','2015-03-03','757','SA','day/night match',656445,'24th Match, Pool B','SA',NULL,'South Africa won by 201 runs','complete','all out','47403','29',45,4.66,'complete','46533','3',50,8.22,'3','49626','39157','13414','4922','49665','656457','656455');
INSERT INTO "matches" VALUES(23,'PAK','2015-03-04','453','UAE','day/night match',656447,'25th Match, Pool B','PAK',NULL,'Pakistan won by 129 runs','complete','complete','19596','7',50,6.78,'complete','47712','27',50,4.2,'27','9230','44971','15383','44449','33135','656455','656469');
INSERT INTO "matches" VALUES(24,'AUS','2015-03-04','213','AUS','day/night match',656449,'26th Match, Pool A','AUS',NULL,'Australia won by 275 runs','complete','complete','8876','2',50,8.34,'all out','46888','40',37.3,3.78,'40','49623','16314','36339','48469','13413','656461','656459');
INSERT INTO "matches" VALUES(25,'SCOT','2015-03-05','2480','SCOT','day match',656451,'27th Match, Pool A','BDESH',NULL,'Bangladesh won by 6 wickets (with 11 balls remaining)','complete','target reached','24672','25',48.1,6.68,'complete','62583','30',50,6.36,'25','4169','37097','7986','5341','7029','656463','656467');
INSERT INTO "matches" VALUES(26,'WI','2015-03-06','213','WI','day/night match',656453,'28th Match, Pool B','INDIA',NULL,'India won by 4 wickets (with 65 balls remaining)','complete','target reached','7593','6',39.1,4.72,'all out','59339','4',44.2,4.1,'4','49623','13413','36339','48469','16314','656465','656479');
INSERT INTO "matches" VALUES(27,'PAK','2015-03-07','283','SA','day/night match',656455,'29th Match, Pool B','PAK','D/L method','Pakistan won by 29 runs (D/L method)','complete','all out','19596','7',46.4,4.75,'all out','46533','3',33.3,6.02,'3','9230','33135','37097','15872','7029','656481','656469');
INSERT INTO "matches" VALUES(28,'IRE','2015-03-07','905','ZIM','day/night match',656457,'30th Match, Pool B','IRE',NULL,'Ireland won by 5 runs','complete','complete','47403','29',50,6.62,'all out','45253','9',49.3,6.58,'9','49626','49665','387601','50159','7326','656465','656475');
INSERT INTO "matches" VALUES(29,'AFG','2015-03-08','453','NZ','day match',656459,'31st Match, Pool A','NZ',NULL,'New Zealand won by 6 wickets (with 83 balls remaining)','complete','target reached','10384','5',36.1,5.19,'all out','46888','40',47.4,3.9,'40','4169','7986','4922','44449','44971','656471','656473');
INSERT INTO "matches" VALUES(30,'AUS','2015-03-08','132','AUS','day/night match',656461,'32nd Match, Pool A','AUS',NULL,'Australia won by 64 runs','complete','complete','8876','2',50,7.52,'all out','47023','8',46.2,6.73,'2','36620','13413','15383','39157','13414','656477','656467');
INSERT INTO "matches" VALUES(31,'BDESH','2015-03-09','131','ENG','day/night match',656463,'33rd Match, Pool A','BDESH',NULL,'Bangladesh won by 15 runs','complete','complete','24672','25',50,5.5,'all out','47055','1',48.3,5.36,'1','49623','49665','5341','36339','7326','656471','656473');
INSERT INTO "matches" VALUES(32,'IRE','2015-03-10','504','IRE','day/night match',656465,'34th Match, Pool B','INDIA',NULL,'India won by 8 wickets (with 79 balls remaining)','complete','target reached','7593','6',36.5,7.05,'all out','47403','29',49,5.28,'29','9230','16314','44449','48469','15872','656475','656481');
INSERT INTO "matches" VALUES(33,'SL','2015-03-11','905','SL','day/night match',656467,'35th Match, Pool A','SL',NULL,'Sri Lanka won by 148 runs','complete','all out','62583','30',43.1,4.98,'complete','47023','8',50,7.26,'8','36620','13414','13413','15383','387601','656477','656483');
INSERT INTO "matches" VALUES(34,'SA','2015-03-12','1166','UAE','day/night match',656469,'36th Match, Pool B','SA',NULL,'South Africa won by 146 runs','complete','complete','46533','3',50,6.82,'all out','47712','27',47.3,4.1,'27','49626','39157','7029','4922','7986','656483','656479');
INSERT INTO "matches" VALUES(35,'BDESH','2015-03-13','504','NZ','day/night match',656471,'37th Match, Pool A','NZ',NULL,'New Zealand won by 3 wickets (with 7 balls remaining)','complete','target reached','10384','5',48.5,5.93,'complete','48277','25',50,5.76,'5','9230','44449','16314','48469','15872','656489','656485');
INSERT INTO "matches" VALUES(36,'AFG','2015-03-13','132','ENG','day/night match',656473,'38th Match, Pool A','ENG','D/L method','England won by 9 wickets (with 41 balls remaining) (D/L method)','complete','complete','46888','40',36.2,3.05,'target reached','47055','1',18.1,5.55,'1','4169','50159','44971','36339','33135','NULL','NULL');
INSERT INTO "matches" VALUES(37,'ZIM','2015-03-14','283','ZIM','day/night match',656475,'39th Match, Pool B','INDIA',NULL,'India won by 6 wickets (with 8 balls remaining)','complete','target reached','7593','6',48.4,5.91,'all out','45253','9',48.5,5.87,'6','49626','4922','7986','37097','7029','656485','NULL');
INSERT INTO "matches" VALUES(38,'SCOT','2015-03-14','905','AUS','day/night match',656477,'40th Match, Pool A','AUS',NULL,'Australia won by 7 wickets (with 208 balls remaining)','complete','target reached','8876','2',15.2,8.67,'all out','62583','30',25.4,5.06,'2','36620','13413','387601','13414','15383','656487','NULL');
INSERT INTO "matches" VALUES(39,'UAE','2015-03-15','453','WI','day match',656479,'41st Match, Pool B','WI',NULL,'West Indies won by 6 wickets (with 117 balls remaining)','complete','all out','47712','27',47.4,3.67,'target reached','59339','4',30.3,5.77,'4','9230','48469','15872','39157','49665','NULL','656489');
INSERT INTO "matches" VALUES(40,'IRE','2015-03-15','131','PAK','day/night match',656481,'42nd Match, Pool B','PAK',NULL,'Pakistan won by 7 wickets (with 23 balls remaining)','complete','all out','47403','29',50,4.74,'target reached','19596','7',46.1,5.22,'29','49623','7326','5341','44971','50159','NULL','656487');
INSERT INTO "matches" VALUES(41,'SL','2015-03-18','132','SL','day/night match',656483,'1st Quarter-Final','SA',NULL,'South Africa won by 9 wickets (with 192 balls remaining)','complete','target reached','46533','3',18,7.44,'all out','47023','8',37.2,3.56,'8','4169','7029','15872','16314','7986','656491','NULL');
INSERT INTO "matches" VALUES(42,'INDIA','2015-03-19','61','INDIA','day/night match',656485,'2nd Quarter-Final','INDIA',NULL,'India won by 109 runs','complete','all out','24672','25',45,4.28,'complete','7593','6',50,6.04,'6','49626','7326','4922','39157','13414','NULL','656493');
INSERT INTO "matches" VALUES(43,'PAK','2015-03-20','131','AUS','day/night match',656487,'3rd Quarter-Final','AUS',NULL,'Australia won by 6 wickets (with 97 balls remaining)','complete','target reached','8876','2',33.5,6.38,'all out','19596','7',49.5,4.27,'7','49623','36339','15383','48469','44971','656493','NULL');
INSERT INTO "matches" VALUES(44,'NZ','2015-03-21','1166','NZ','day/night match',656489,'4th Quarter-Final','NZ',NULL,'New Zealand won by 143 runs','complete','complete','10384','5',50,7.86,'all out','59339','4',30.3,8.19,'5','9230','16314','7986','15872','7029','656491','NULL');
INSERT INTO "matches" VALUES(45,'SA','2015-03-24','283','NZ','day/night match',656491,'1st Semi-Final','NZ','D/L method','New Zealand won by 4 wickets (with 1 ball remaining) (D/L method)','complete','target reached','10384','5',42.5,6.98,'complete','46533','3',43,6.53,'3','4169','7029','16314','13414','7986','656495','NULL');
INSERT INTO "matches" VALUES(46,'AUS','2015-03-26','132','AUS','day/night match',656493,'2nd Semi-Final','AUS',NULL,'Australia won by 95 runs','complete','complete','8876','2',50,6.56,'all out','7593','6',46.5,4.97,'2','49623','15383','44971','48469','15872','656495','NULL');
INSERT INTO "matches" VALUES(47,'NZ','2015-03-29','61','AUS','day/night match',656495,'Final','AUS',NULL,'Australia won by 7 wickets (with 101 balls remaining)','complete','target reached','8876','2',33.1,5.6,'all out','10384','5',45,4.06,'5','49623','13414','44971','48469','15872','NULL','NULL');

INSERT INTO "grounds" VALUES(0,'93','Hagley Oval, Christchurch','Oceania','','Christchurch','824');
INSERT INTO "grounds" VALUES(1,'61','Melbourne Cricket Ground','Oceania','Victoria','Melbourne','25');
INSERT INTO "grounds" VALUES(2,'504','Seddon Park, Hamilton','Oceania','','Hamilton','827');
INSERT INTO "grounds" VALUES(3,'131','Adelaide Oval','Oceania','South Australia','Adelaide','2');
INSERT INTO "grounds" VALUES(4,'2480','Saxton Oval, Nelson','Oceania','','Nelson','837');
INSERT INTO "grounds" VALUES(5,'769','University Oval, Dunedin','Oceania','','Dunedin','825');
INSERT INTO "grounds" VALUES(6,'757','Manuka Oval, Canberra','Oceania','Australian Capital Territory','Canberra','13');
INSERT INTO "grounds" VALUES(8,'1166','Westpac Stadium, Wellington','Oceania','','Wellington','851');
INSERT INTO "grounds" VALUES(14,'209','Brisbane Cricket Ground, Woolloongabba, Brisbane','Oceania','Queensland','Brisbane','8');
INSERT INTO "grounds" VALUES(17,'132','Sydney Cricket Ground','Oceania','New South Wales','Sydney','29');
INSERT INTO "grounds" VALUES(18,'283','Eden Park, Auckland','Oceania','','Auckland','822');
INSERT INTO "grounds" VALUES(19,'213','Western Australia Cricket Association Ground, Perth','Oceania','Western Australia','Perth','27');
INSERT INTO "grounds" VALUES(23,'453','McLean Park, Napier','Oceania','','Napier','836');
INSERT INTO "grounds" VALUES(28,'905','Bellerive Oval, Hobart','Oceania','Tasmania','Hobart','20');

INSERT INTO "officials" VALUES(0,'50','1964-02-27','Marais Erasmus','44971','South Africa');
INSERT INTO "officials" VALUES(1,'46','1968-06-06','Aleem Dar','39157','Pakistan');
INSERT INTO "officials" VALUES(2,'47','1967-06-24','Ranmore Martinesz','49665','Sri Lanka');
INSERT INTO "officials" VALUES(3,'57','1957-08-19','Ian Gould','13414','England');
INSERT INTO "officials" VALUES(4,'51','1963-08-23','Richard Illingworth','15383','England');
INSERT INTO "officials" VALUES(5,'48','1966-07-29','Simon Fry','5341','Australia');
INSERT INTO "officials" VALUES(6,'62','1952-04-09','Steve Davis','4922','Australia');
INSERT INTO "officials" VALUES(7,'43','1971-07-21','Johan Cloete','44449','South Africa');
INSERT INTO "officials" VALUES(8,'48','1966-04-19','Paul Reiffel','7326','Australia');
INSERT INTO "officials" VALUES(10,'39','1975-11-30','Chris Gaffaney','37097','New Zealand');
INSERT INTO "officials" VALUES(12,'48','1966-04-22','Sundaram Ravi','33135','India');
INSERT INTO "officials" VALUES(14,'35','1979-12-18','Michael Gough','13413','England');
INSERT INTO "officials" VALUES(18,'51','1964-02-27','Marais Erasmus','44971','South Africa');
INSERT INTO "officials" VALUES(19,'51','1963-04-11','Billy Bowden','36339','New Zealand');
INSERT INTO "officials" VALUES(20,'54','1960-03-05','Bruce Oxenford','7029','Australia');
INSERT INTO "officials" VALUES(21,'41','1973-03-15','Richard Kettleborough','15872','England');
INSERT INTO "officials" VALUES(24,'43','1971-04-24','Kumar Dharmasena','48469','Sri Lanka');
INSERT INTO "officials" VALUES(28,'47','1968-01-22','Ruchira Palliyaguruge','50159','Sri Lanka');
INSERT INTO "officials" VALUES(41,'46','1969-02-11','Nigel Llong','16314','England');
INSERT INTO "officials" VALUES(44,'42','1973-03-15','Richard Kettleborough','15872','England');
INSERT INTO "officials" VALUES(50,'50','1964-08-28','Rod Tucker','7986','Australia');
INSERT INTO "officials" VALUES(54,'48','1966-12-30','Joel Wilson','387601','West Indies');
INSERT INTO "officials" VALUES(73,'55','1960-03-05','Bruce Oxenford','7029','Australia');
INSERT INTO "officials" VALUES(144,'54','1960-12-29','David Boon','4169','Australia');
INSERT INTO "officials" VALUES(145,'56','1958-09-14','Jeff Crowe','36620','New Zealand');
INSERT INTO "officials" VALUES(146,'48','1966-05-31','Roshan Mahanama','49626','Sri Lanka');
INSERT INTO "officials" VALUES(147,'55','1959-04-22','Ranjan Madugalle','49623','Sri Lanka');
INSERT INTO "officials" VALUES(148,'57','1957-09-29','Chris Broad','9230','England');

INSERT INTO "players" VALUES(0,'1986-09-30','48927','Martin Guptill','opening batsman','5');
INSERT INTO "players" VALUES(1,'1986-10-27','48739','David Warner','opening batsman','2');
INSERT INTO "players" VALUES(2,'1992-12-17','58406','Quinton de Kock','wicketkeeper batsman','3');
INSERT INTO "players" VALUES(3,'1987-04-30','48405','Rohit Sharma','middle-order batsman','6');
INSERT INTO "players" VALUES(4,'1984-09-06','47403','William Porterfield','opening batsman','29');
INSERT INTO "players" VALUES(6,'1992-01-02','53112','Javed Ahmadi','top-order batsman','40');
INSERT INTO "players" VALUES(7,'1979-09-25','46491','Amjad Ali','batsman','27');
INSERT INTO "players" VALUES(9,'1989-12-06','48293','Nasir Jamshed','opening batsman','7');
INSERT INTO "players" VALUES(12,'1987-06-18','46597','Moeen Ali','batting allrounder','1');
INSERT INTO "players" VALUES(13,'1983-04-12','45554','Dwayne Smith','allrounder','4');
INSERT INTO "players" VALUES(16,'1989-03-20','48391','Tamim Iqbal','opening batsman','25');
INSERT INTO "players" VALUES(27,'1987-05-22','48983','Sarfraz Ahmed','wicketkeeper batsman','7');
INSERT INTO "players" VALUES(30,'1986-11-17','35812','Aaron Finch','top-order batsman','2');
INSERT INTO "players" VALUES(33,'1984-04-14','46048','Kyle Coetzer','top-order batsman','30');
INSERT INTO "players" VALUES(34,'1983-03-31','9952','Hashim Amla','top-order batsman','3');
INSERT INTO "players" VALUES(38,'1981-04-02','8876','Michael Clarke','middle-order batsman','2');
INSERT INTO "players" VALUES(48,'1981-09-27','10384','Brendon McCullum','wicketkeeper batsman','5');
INSERT INTO "players" VALUES(51,'1985-12-05','15887','Shikhar Dhawan','opening batsman','6');
INSERT INTO "players" VALUES(52,'1990-09-03','52631','Paul Stirling','allrounder','29');
INSERT INTO "players" VALUES(54,'1993-08-10','60460','Afsar Zazai','wicketkeeper batsman','40');
INSERT INTO "players" VALUES(55,'1991-08-29','58893','Andri Berenger','opening batsman','27');
INSERT INTO "players" VALUES(57,'1991-11-23','49899','Ahmed Shehzad','opening batsman','7');
INSERT INTO "players" VALUES(58,'1984-07-15','53602','Nawroz Mangal','top-order batsman','40');
INSERT INTO "players" VALUES(60,'1982-04-11','7822','Ian Bell','top-order batsman','1');
INSERT INTO "players" VALUES(61,'1979-09-21','7568','Chris Gayle','allrounder','4');
INSERT INTO "players" VALUES(64,'1992-12-16','58536','Anamul Haque','wicketkeeper batsman','25');
INSERT INTO "players" VALUES(73,'1993-02-25','61619','Soumya Sarkar','middle-order batsman','25');
INSERT INTO "players" VALUES(79,'1987-02-02','51239','Imrul Kayes','opening batsman','25');
INSERT INTO "players" VALUES(81,'1988-11-15','49112','Calum MacLeod','top-order batsman','30');
INSERT INTO "players" VALUES(96,'1990-08-08','51088','Kane Williamson','top-order batsman','5');
INSERT INTO "players" VALUES(97,'1981-06-17','10125','Shane Watson','allrounder','2');
INSERT INTO "players" VALUES(98,'1984-07-13','46933','Faf du Plessis','middle-order batsman','3');
INSERT INTO "players" VALUES(99,'1988-11-05','49752','Virat Kohli','middle-order batsman','6');
INSERT INTO "players" VALUES(100,'1978-09-22','7233','Ed Joyce','top-order batsman','29');
INSERT INTO "players" VALUES(103,'1984-08-24','51466','Krishna Chandran','allrounder','27');
INSERT INTO "players" VALUES(105,'1977-11-29','10439','Younis Khan','middle-order batsman','7');
INSERT INTO "players" VALUES(106,'1987-12-22','53809','Asghar Stanikzai','middle-order batsman','40');
INSERT INTO "players" VALUES(108,'1989-11-22','49115','Gary Ballance','middle-order batsman','1');
INSERT INTO "players" VALUES(109,'1981-02-05','10238','Marlon Samuels','top-order batsman','4');
INSERT INTO "players" VALUES(117,'1989-01-09','53639','Haris Sohail','middle-order batsman','7');
INSERT INTO "players" VALUES(120,'1989-06-02','50281','Steven Smith','allrounder','2');
INSERT INTO "players" VALUES(121,'1986-02-04','47352','Mahmudullah','allrounder','25');
INSERT INTO "players" VALUES(129,'1991-02-15','52184','Matt Machan','top-order batsman','30');
INSERT INTO "players" VALUES(130,'1989-10-09','53649','Rilee Rossouw','top-order batsman','3');
INSERT INTO "players" VALUES(144,'1984-03-08','44930','Ross Taylor','middle-order batsman','5');
INSERT INTO "players" VALUES(146,'1984-02-17','46533','AB de Villiers','wicketkeeper batsman','3');
INSERT INTO "players" VALUES(147,'1986-11-27','15716','Suresh Raina','middle-order batsman','6');
INSERT INTO "players" VALUES(148,'1981-11-08','10351','Niall O''Brien','wicketkeeper batsman','29');
INSERT INTO "players" VALUES(151,'1971-06-21','36602','Khurram Khan','top-order batsman','27');
INSERT INTO "players" VALUES(154,'1987-02-03','53605','Samiullah Shenwari','allrounder','40');
INSERT INTO "players" VALUES(155,'1988-06-06','51096','Ajinkya Rahane','top-order batsman','6');
INSERT INTO "players" VALUES(156,'1990-12-30','52656','Joe Root','top-order batsman','1');
INSERT INTO "players" VALUES(157,'1987-11-16','53389','Jonathan Carter','allrounder','4');
INSERT INTO "players" VALUES(160,'1991-09-29','58225','Mominul Haque','middle-order batsman','25');
INSERT INTO "players" VALUES(165,'1974-05-28','19596','Misbah-ul-Haq','middle-order batsman','7');
INSERT INTO "players" VALUES(167,'1987-04-15','47686','Sohaib Maqsood','middle-order batsman','7');
INSERT INTO "players" VALUES(168,'1988-10-14','54222','Glenn Maxwell','batting allrounder','2');
INSERT INTO "players" VALUES(169,'1987-06-09','47986','Mushfiqur Rahim','wicketkeeper batsman','25');
INSERT INTO "players" VALUES(172,'1990-12-28','52628','Andy Balbirnie','opening batsman','29');
INSERT INTO "players" VALUES(177,'1987-10-14','62583','Preston Mommsen','opening batsman','30');
INSERT INTO "players" VALUES(180,'1993-12-21','65860','Nasir Jamal','middle-order batsman','40');
INSERT INTO "players" VALUES(182,'1990-04-29','50483','James Faulkner','bowling allrounder','2');
INSERT INTO "players" VALUES(192,'1979-03-21','6329','Grant Elliott','allrounder','5');
INSERT INTO "players" VALUES(193,'1982-09-07','35384','George Bailey','top-order batsman','2');
INSERT INTO "players" VALUES(194,'1989-06-10','53891','David Miller','middle-order batsman','3');
INSERT INTO "players" VALUES(195,'1981-07-07','7593','MS Dhoni','wicketkeeper batsman','6');
INSERT INTO "players" VALUES(199,'1985-04-15','62044','Swapnil Patil','wicketkeeper batsman','27');
INSERT INTO "players" VALUES(202,'1985-01-01','46888','Mohammad Nabi','allrounder','40');
INSERT INTO "players" VALUES(204,'1986-09-10','47055','Eoin Morgan','middle-order batsman','1');
INSERT INTO "players" VALUES(205,'1985-03-13','47111','Denesh Ramdin','wicketkeeper batsman','4');
INSERT INTO "players" VALUES(213,'1990-05-26','53546','Umar Akmal','middle-order batsman','7');
INSERT INTO "players" VALUES(217,'1987-03-24','48277','Shakib Al Hasan','allrounder','25');
INSERT INTO "players" VALUES(220,'1984-03-04','47397','Kevin O''Brien','allrounder','29');
INSERT INTO "players" VALUES(225,'1991-12-15','57777','Freddie Coleman','opening batsman','30');
INSERT INTO "players" VALUES(231,'1979-03-15','45742','Shaiman Anwar','top-order batsman','27');
INSERT INTO "players" VALUES(236,'1990-12-13','51057','Corey Anderson','batting allrounder','5');
INSERT INTO "players" VALUES(242,'1984-04-14','45222','Jean-Paul Duminy','batting allrounder','3');
INSERT INTO "players" VALUES(243,'1988-12-06','49247','Ravindra Jadeja','allrounder','6');
INSERT INTO "players" VALUES(244,'1986-02-05','47401','Gary Wilson','wicketkeeper batsman','29');
INSERT INTO "players" VALUES(250,'1993-02-28','65861','Najibullah Zadran','middle-order batsman','40');
INSERT INTO "players" VALUES(252,'1990-01-06','52246','James Taylor','middle-order batsman','1');
INSERT INTO "players" VALUES(253,'1985-01-25','45256','Lendl Simmons','top-order batsman','4');
INSERT INTO "players" VALUES(261,'1980-03-01','4169','Shahid Afridi','allrounder','7');
INSERT INTO "players" VALUES(264,'1991-10-20','50771','Mitchell Marsh','top-order batsman','2');
INSERT INTO "players" VALUES(265,'1991-11-22','58220','Sabbir Rahman','middle-order batsman','25');
INSERT INTO "players" VALUES(273,'1987-04-03','48469','Richie Berrington','top-order batsman','30');
INSERT INTO "players" VALUES(276,'1989-08-07','57628','Shafiqullah','wicketkeeper batsman','40');
INSERT INTO "players" VALUES(288,'1981-04-23','17850','Luke Ronchi','wicketkeeper batsman','5');
INSERT INTO "players" VALUES(290,'1983-10-09','48148','Farhaan Behardien','batting allrounder','3');
INSERT INTO "players" VALUES(295,'1988-10-07','53033','Rohan Mustafa','middle-order batsman','27');
INSERT INTO "players" VALUES(300,'1990-09-08','53271','Jos Buttler','wicketkeeper batsman','1');
INSERT INTO "players" VALUES(301,'1983-12-20','44829','Darren Sammy','allrounder','4');
INSERT INTO "players" VALUES(312,'1977-10-23','6426','Brad Haddin','wicketkeeper batsman','2');
INSERT INTO "players" VALUES(316,'1982-02-10','10345','John Mooney','allrounder','29');
INSERT INTO "players" VALUES(321,'1990-10-29','60198','Michael Leask','allrounder','30');
INSERT INTO "players" VALUES(327,'1980-07-05','48412','Amjad Javed','allrounder','27');
INSERT INTO "players" VALUES(336,'1979-01-27','4380','Daniel Vettori','allrounder','5');
INSERT INTO "players" VALUES(338,'1985-06-24','46935','Vernon Philander','allrounder','3');
INSERT INTO "players" VALUES(339,'1986-09-17','12894','Ravichandran Ashwin','bowling allrounder','6');
INSERT INTO "players" VALUES(342,'1988-06-30','59061','Mirwais Ashraf','bowler','40');
INSERT INTO "players" VALUES(348,'1989-03-02','49496','Chris Woakes','bowler','1');
INSERT INTO "players" VALUES(349,'1988-04-29','51012','Andre Russell','allrounder','4');
INSERT INTO "players" VALUES(351,'1991-03-16','57022','Gulbadin Naib','bowler','40');
INSERT INTO "players" VALUES(353,'1983-06-27','47154','Dale Steyn','bowler','3');
INSERT INTO "players" VALUES(357,'1985-06-28','24723','Wahab Riaz','bowler','7');
INSERT INTO "players" VALUES(361,'1991-11-30','52363','Nasir Hossain','allrounder','25');
INSERT INTO "players" VALUES(367,'1983-10-05','24672','Mashrafe Mortaza','bowler','25');
INSERT INTO "players" VALUES(369,'1992-10-15','60303','Matthew Cross','wicketkeeper batsman','30');
INSERT INTO "players" VALUES(375,'1986-06-16','62028','Nasir Aziz','bowler','27');
INSERT INTO "players" VALUES(376,'1991-08-15','60195','Stuart Thompson','bowler','29');
INSERT INTO "players" VALUES(384,'1988-12-11','49108','Tim Southee','bowler','5');
INSERT INTO "players" VALUES(385,'1981-11-02','10130','Mitchell Johnson','bowler','2');
INSERT INTO "players" VALUES(387,'1990-09-03','63646','Mohammed Shami','bowler','6');
INSERT INTO "players" VALUES(388,'1985-11-18','66284','Max Sorensen','bowler','29');
INSERT INTO "players" VALUES(389,'1992-04-13','62153','Adam Milne','bowler','5');
INSERT INTO "players" VALUES(390,'1992-11-30','61857','Aftab Alam','bowler','40');
INSERT INTO "players" VALUES(391,'1987-06-03','66386','Mohammad Naveed','bowler','27');
INSERT INTO "players" VALUES(394,'1988-03-19','65399','Dawlat Zadran','bowler','40');
INSERT INTO "players" VALUES(396,'1986-06-24','48440','Stuart Broad','bowler','1');
INSERT INTO "players" VALUES(397,'1991-11-05','59339','Jason Holder','bowling allrounder','4');
INSERT INTO "players" VALUES(398,'1980-10-29','51559','Alex Cusack','bowler','29');
INSERT INTO "players" VALUES(401,'1987-06-18','52222','Kyle Abbott','bowler','3');
INSERT INTO "players" VALUES(403,'1990-02-05','54282','Bhuvneshwar Kumar','bowler','6');
INSERT INTO "players" VALUES(405,'1984-03-06','53540','Sohail Khan','bowler','7');
INSERT INTO "players" VALUES(406,'1992-07-22','56811','George Dockrell','bowler','29');
INSERT INTO "players" VALUES(410,'1988-09-18','66722','Mohit Sharma','bowler','6');
INSERT INTO "players" VALUES(415,'1986-09-29','45560','Arafat Sunny','bowler','25');
INSERT INTO "players" VALUES(417,'1989-12-21','57140','Rob Taylor','allrounder','30');
INSERT INTO "players" VALUES(420,'1987-06-01','53326','Hamid Hassan','bowler','40');
INSERT INTO "players" VALUES(428,'1989-07-22','51092','Trent Boult','bowler','5');
INSERT INTO "players" VALUES(429,'1991-12-14','64947','Matt Henry','bowler','5');
INSERT INTO "players" VALUES(433,'1990-01-30','53330','Mitchell Starc','bowler','2');
INSERT INTO "players" VALUES(434,'1979-03-27','19422','Imran Tahir','bowler','3');
INSERT INTO "players" VALUES(435,'1987-10-25','58274','Umesh Yadav','bowler','6');
INSERT INTO "players" VALUES(439,'1972-01-14','47712','Mohammad Tauqir','bowler','27');
INSERT INTO "players" VALUES(444,'1989-04-04','48529','Steven Finn','bowler','1');
INSERT INTO "players" VALUES(445,'1984-06-22','46591','Jerome Taylor','bowler','4');
INSERT INTO "players" VALUES(448,'1990-01-01','52364','Rubel Hossain','bowler','25');
INSERT INTO "players" VALUES(449,'1984-10-06','47289','Morne Morkel','bowler','3');
INSERT INTO "players" VALUES(453,'1988-09-12','54013','Rahat Ali','bowler','7');
INSERT INTO "players" VALUES(465,'1990-08-03','59951','Josh Davey','allrounder','30');
INSERT INTO "players" VALUES(481,'1991-01-08','51367','Josh Hazlewood','bowler','2');
INSERT INTO "players" VALUES(484,'1993-04-30','60322','Andy McBrine','bowler','29');
INSERT INTO "players" VALUES(486,'1987-07-08','53755','Shapoor Zadran','bowler','40');
INSERT INTO "players" VALUES(489,'1982-06-06','61264','Mohammad Irfan','bowler','7');
INSERT INTO "players" VALUES(492,'1982-07-30','10829','James Anderson','bowler','1');
INSERT INTO "players" VALUES(493,'1982-05-16','48087','Nikita Miller','bowler','4');
INSERT INTO "players" VALUES(496,'1995-04-03','66808','Taskin Ahmed','bowler','25');
INSERT INTO "players" VALUES(510,'1982-11-22','12912','Xavier Doherty','bowler','2');
INSERT INTO "players" VALUES(513,'1989-01-12','59616','Alasdair Evans','bowler','30');
INSERT INTO "players" VALUES(515,'1986-06-11','53716','Mitchell McClenaghan','bowler','5');
INSERT INTO "players" VALUES(518,'1993-05-08','64244','Pat Cummins','bowler','2');
INSERT INTO "players" VALUES(519,'1981-02-14','12206','Manjula Guruge','bowler','27');
INSERT INTO "players" VALUES(528,'1989-08-09','52405','Lahiru Thirimanne','top-order batsman','8');
INSERT INTO "players" VALUES(530,'1986-09-06','47619','Chamu Chibhabha','top-order batsman','9');
INSERT INTO "players" VALUES(535,'1986-04-24','52319','Sikandar Raza','batting allrounder','9');
INSERT INTO "players" VALUES(564,'1989-01-03','49532','Alex Hales','opening batsman','1');
INSERT INTO "players" VALUES(569,'1990-08-17','52373','Kusal Perera','wicketkeeper batsman','8');
INSERT INTO "players" VALUES(576,'1976-10-14','7419','Tillakaratne Dilshan','allrounder','8');
INSERT INTO "players" VALUES(583,'1987-09-20','51554','Regis Chakabva','wicketkeeper batsman','9');
INSERT INTO "players" VALUES(600,'1996-11-20','74913','Usman Ghani','opening batsman','40');
INSERT INTO "players" VALUES(613,'1983-08-09','10423','Hamilton Masakadza','top-order batsman','9');
INSERT INTO "players" VALUES(615,'1989-01-14','55194','Johnson Charles','wicketkeeper batsman','4');
INSERT INTO "players" VALUES(624,'1977-10-27','9587','Kumar Sangakkara','wicketkeeper batsman','8');
INSERT INTO "players" VALUES(628,'1989-02-06','51054','Darren Bravo','top-order batsman','4');
INSERT INTO "players" VALUES(629,'1991-01-04','71239','Hamish Gardiner','opening batsman','30');
INSERT INTO "players" VALUES(652,'1989-08-21','51444','Solomon Mire','batsman','9');
INSERT INTO "players" VALUES(672,'1977-05-27','6315','Mahela Jayawardene','batsman','8');
INSERT INTO "players" VALUES(674,'1986-02-06','45253','Brendan Taylor','wicketkeeper batsman','9');
INSERT INTO "players" VALUES(682,'1988-04-21','48988','Dimuth Karunaratne','opening batsman','8');
INSERT INTO "players" VALUES(722,'1986-09-26','47206','Sean Williams','middle-order batsman','9');
INSERT INTO "players" VALUES(740,'1987-06-02','47023','Angelo Mathews','allrounder','8');
INSERT INTO "players" VALUES(770,'1985-08-19','47205','Craig Ervine','middle-order batsman','9');
INSERT INTO "players" VALUES(798,'1989-11-18','52371','Dinesh Chandimal','wicketkeeper batsman','8');
INSERT INTO "players" VALUES(802,'1987-08-10','78011','Saqlain Haider','middle-order batsman','27');
INSERT INTO "players" VALUES(816,'1983-01-15','24777','Jeevan Mendis','allrounder','8');
INSERT INTO "players" VALUES(818,'1986-03-14','45252','Elton Chigumbura','allrounder','9');
INSERT INTO "players" VALUES(827,'1989-07-30','50121','Wayne Parnell','bowler','3');
INSERT INTO "players" VALUES(829,'1983-05-03','10639','Stuart Matsikenyeri',NULL,'9');
INSERT INTO "players" VALUES(846,'1989-04-03','49193','Thisara Perera','allrounder','8');
INSERT INTO "players" VALUES(852,'1985-05-04','44691','Ravi Bopara','middle-order batsman','1');
INSERT INTO "players" VALUES(864,'1982-07-22','46206','Nuwan Kulasekara','bowler','8');
INSERT INTO "players" VALUES(894,'1985-02-02','11334','Upul Tharanga','batsman','8');
INSERT INTO "players" VALUES(897,'1985-06-27','50378','Seekkuge Prasanna','allrounder','8');
INSERT INTO "players" VALUES(900,'1988-10-04','51421','Chris Jordan','bowler','1');
INSERT INTO "players" VALUES(912,'1978-03-19','8460','Rangana Herath','bowler','8');
INSERT INTO "players" VALUES(914,'1985-10-21','47209','Tinashe Panyangara','bowler','9');
INSERT INTO "players" VALUES(915,'1986-05-02','45170','Yasir Shah','bowler','7');
INSERT INTO "players" VALUES(924,'1983-02-11','46091','Majid Haq','bowler','30');
INSERT INTO "players" VALUES(933,'1985-04-16','45215','Tawanda Mupariwa','bowler','9');
INSERT INTO "players" VALUES(948,'1982-02-27','10831','James Tredwell','allrounder','1');
INSERT INTO "players" VALUES(953,'1993-03-05','62763','Tharindu Kaushal','bowler','8');
INSERT INTO "players" VALUES(955,'1993-03-15','67169','Ehsan Adil','bowler','7');
INSERT INTO "players" VALUES(960,'1983-08-28','45105','Lasith Malinga','bowler','8');
INSERT INTO "players" VALUES(962,'1991-02-28','60782','Tendai Chatara','bowler','9');
INSERT INTO "players" VALUES(964,'1988-06-30','49034','Kemar Roach','bowler','4');
INSERT INTO "players" VALUES(990,'1985-02-09','50837','Sachithra Senanayake','bowler','8');
INSERT INTO "players" VALUES(994,'1980-08-25','70560','Kamran Shazad','bowler','27');
INSERT INTO "players" VALUES(995,'1992-02-07','59679','Taijul Islam','bowler','25');
INSERT INTO "players" VALUES(1001,'1992-01-11','67342','Dushmantha Chameera','bowler','8');
INSERT INTO "players" VALUES(1008,'1987-03-10','46995','Suranga Lakmal','bowler','8');
INSERT INTO "players" VALUES(1010,'1987-06-08','49272','Tafadzwa Kamungozi','allrounder','9');
INSERT INTO "players" VALUES(1013,'1985-06-29','64991','Iain Wardlaw','bowler','30');
INSERT INTO "players" VALUES(1017,'1981-07-22','10506','Sulieman Benn','bowler','4');
INSERT INTO "players" VALUES(1042,'1982-07-31','48749','Fahad Alhashmi','bowler','27');

INSERT INTO "teams" VALUES(12,1,'ENG');
INSERT INTO "teams" VALUES(1,2,'AUS');
INSERT INTO "teams" VALUES(2,3,'SA');
INSERT INTO "teams" VALUES(13,4,'WI');
INSERT INTO "teams" VALUES(0,5,'NZ');
INSERT INTO "teams" VALUES(3,6,'INDIA');
INSERT INTO "teams" VALUES(9,7,'PAK');
INSERT INTO "teams" VALUES(48,8,'SL');
INSERT INTO "teams" VALUES(50,9,'ZIM');
INSERT INTO "teams" VALUES(16,25,'BDESH');
INSERT INTO "teams" VALUES(7,27,'UAE');
INSERT INTO "teams" VALUES(4,29,'IRE');
INSERT INTO "teams" VALUES(33,30,'SCOT');
INSERT INTO "teams" VALUES(6,40,'AFG');
