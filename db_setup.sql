/*

This SQL script creates a schema for matches, players, teams, coaches and venues of the 2015 Cricket World Cup. It is intended for use in Oracle Live SQL.

Due to the size of the file, it is best to upload half of it at a time.

*/

-- Table Setup

DROP TABLE matches;
CREATE TABLE matches (
  old_index INTEGER,
  batting_first VARCHAR(25),
  match_date DATE,
  ground_id INTEGER,
  home_team VARCHAR(25),
  lighting VARCHAR(25),
  match_id INTEGER  PRIMARY KEY,
  match_title VARCHAR(50),
  match_winner VARCHAR(25),
  rain_rule VARCHAR(25),
  match_result VARCHAR(100),
  status VARCHAR(20),
  team_1_batting_result VARCHAR(25),
  team_1_captain INTEGER,
  team_1_id INTEGER,
  team_1_overs_batted NUMERIC(5,2),
  team_1_run_rate NUMERIC(5,2),
  team_2_batting_result VARCHAR(100),
  team_2_captain INTEGER,
  team_2_id INTEGER,
  team_2_overs_batted NUMERIC(5,2),
  team_2_run_rate NUMERIC(5,2),
  toss_winner INTEGER,
  referee INTEGER,
  reserve_umpire INTEGER,
  tv_umpire INTEGER,
  umpire_1_id INTEGER,
  umpire_2_id INTEGER,
  team_1_next_match INTEGER,
  team_2_next_match INTEGER
);

DROP TABLE grounds;
CREATE TABLE grounds (
  old_index INTEGER,
  ground_id INTEGER PRIMARY KEY,
  ground_name VARCHAR(75),
  continent VARCHAR(20),
  town_area VARCHAR(50),
  town_name VARCHAR(20),
  town_id INTEGER
);

DROP TABLE officials;
CREATE TABLE officials (
  old_index INTEGER,
  age_years INTEGER,
  dob DATE,
  name VARCHAR(50),
  official_id INTEGER,
  team_name VARCHAR(25)
);

DROP TABLE players;
CREATE TABLE players (
  old_index INTEGER,
  dob DATE,
  player_id INTEGER PRIMARY KEY,
  player_name VARCHAR(50),
  player_primary_role VARCHAR(25),
  team_id INTEGER
  	CONSTRAINT check_team_id
  	CHECK (team_id BETWEEN 0 and 50)
);

DROP TABLE teams;
CREATE TABLE teams (
  old_index INTEGER,
  team_id INTEGER PRIMARY KEY,
  team_abbreviation VARCHAR(5)
);


-- Insert Data

INSERT INTO matches VALUES(1,'AUS','14-FEB-2015','61','AUS','day/night match',656401,'2nd Match, Pool A','AUS',NULL,'Australia won by 111 runs','complete','complete','35384','2',50,6.84,'all out','47055','1',41.5,5.52,'1','36620','387601','36339','39157','48469','656437','656415');
INSERT INTO matches VALUES(0,'NZ','14-FEB-2015','93','NZ','day match',656399,'1st Match, Pool A','NZ',NULL,'New Zealand won by 98 runs','complete','complete','10384','5',50,6.62,'all out','47023','8',46.1,5.04,'8','4169','5341','33135','44971','16314','656409','656421');
INSERT INTO matches VALUES(2,'SA','15-FEB-2015','504','ZIM','day/night match',656403,'3rd Match, Pool B','SA',NULL,'South Africa won by 62 runs','complete','complete','46533','3',50,6.78,'all out','45252','9',48.2,5.73,'9','49626','50159','7326','49665','7986','656423','656413');
INSERT INTO matches VALUES(3,'INDIA','15-FEB-2015','131','PAK','day/night match',656405,'4th Match, Pool B','INDIA',NULL,'India won by 76 runs','complete','complete','7593','6',50,6,'all out','19596','7',47,4.76,'6','49623','13413','4922','13414','15872','656423','656417');
INSERT INTO matches VALUES(4,'WI','16-FEB-2015','2480','WI','day match',656407,'5th Match, Pool B','IRE',NULL,'Ireland won by 4 wickets (with 25 balls remaining)','complete','target reached','47403','29',45.5,6.69,'complete','59339','4',50,6.08,'29','9230','44449','37097','15383','7029','656429','656417');
INSERT INTO matches VALUES(5,'SCOT','17-FEB-2015','769','NZ','day match',656409,'6th Match, Pool A','NZ',NULL,'New Zealand won by 3 wickets (with 151 balls remaining)','complete','target reached','10384','5',24.5,5.87,'all out','62583','30',36.2,3.9,'5','4169','33135','44971','5341','16314','656415','656425');
INSERT INTO matches VALUES(6,'BDESH','18-FEB-2015','757','BDESH','day/night match',656411,'7th Match, Pool A','BDESH',NULL,'Bangladesh won by 105 runs','complete','all out','46888','40',42.5,3.78,'all out','24672','25',50,5.34,'25','36620','15872','39157','4922','387601','656421','656433');
INSERT INTO matches VALUES(7,'UAE','19-FEB-2015','2480','ZIM','day match',656413,'8th Match, Pool B','ZIM',NULL,'Zimbabwe won by 4 wickets (with 12 balls remaining)','complete','complete','47712','27',50,5.7,'target reached','45252','9',48,5.95,'9','9230','49665','15383','44449','37097','656429','656427');
INSERT INTO matches VALUES(8,'ENG','20-FEB-2015','1166','NZ','day/night match',656415,'9th Match, Pool A','NZ',NULL,'New Zealand won by 8 wickets (with 226 balls remaining)','complete','target reached','10384','5',12.2,10.13,'all out','47055','1',33.2,3.69,'1','49626','50159','7029','7326','7986','656437','656425');
INSERT INTO matches VALUES(9,'WI','21-FEB-2015','93','WI','day match',656417,'10th Match, Pool B','WI',NULL,'West Indies won by 150 runs','complete','all out','19596','7',39,4.1,'complete','59339','4',50,6.2,'7','4169','5341','33135','44971','16314','656443','656427');
INSERT INTO matches VALUES(10,'AFG','22-FEB-2015','769','SL','day match',656421,'12th Match, Pool A','SL',NULL,'Sri Lanka won by 4 wickets (with 10 balls remaining)','complete','all out','46888','40',49.4,4.67,'target reached','47023','8',48.2,4.88,'8','9230','7029','44449','37097','15383','656431','656433');
INSERT INTO matches VALUES(11,'INDIA','22-FEB-2015','61','SA','day/night match',656423,'13th Match, Pool B','INDIA',NULL,'India won by 130 runs','complete','complete','7593','6',50,6.14,'all out','46533','3',40.2,4.38,'6','36620','387601','4922','39157','15872','656439','656435');
INSERT INTO matches VALUES(12,'ENG','23-FEB-2015','93','SCOT','day match',656425,'14th Match, Pool A','ENG',NULL,'England won by 119 runs','complete','complete','47055','1',50,6.06,'all out','62583','30',42.2,4.34,'30','4169','7326','44971','33135','7986','656441','656431');
INSERT INTO matches VALUES(13,'WI','24-FEB-2015','757','ZIM','day/night match',656427,'15th Match, Pool B','WI','D/L method','West Indies won by 73 runs (D/L method)','complete','complete','59339','4',50,7.44,'all out','45252','9',44.3,6.49,'4','49626','15872','49665','4922','13414','656435','656443');
INSERT INTO matches VALUES(14,'UAE','25-FEB-2015','209','UAE','day/night match',656429,'16th Match, Pool B','IRE',NULL,'Ireland won by 2 wickets (with 4 balls remaining)','complete','target reached','47403','29',49.2,5.65,'complete','47712','27',50,5.56,'29','49623','36339','48469','13413','16314','656445','656439');
INSERT INTO matches VALUES(15,'SCOT','26-FEB-2015','769','SCOT','day match',656431,'17th Match, Pool A','AFG',NULL,'Afghanistan won by 1 wicket (with 3 balls remaining)','complete','target reached','46888','40',49.3,4.26,'all out','62583','30',50,4.2,'40','4169','37097','7986','5341','50159','656449','656451');
INSERT INTO matches VALUES(16,'SL','26-FEB-2015','61','SL','day/night match',656433,'18th Match, Pool A','SL',NULL,'Sri Lanka won by 92 runs','complete','all out','24672','25',47,5.1,'complete','47023','8',50,6.64,'8','36620','387601','15872','39157','7326','656451','656441');
INSERT INTO matches VALUES(17,'SA','27-FEB-2015','132','WI','day/night match',656435,'19th Match, Pool B','SA',NULL,'South Africa won by 257 runs','complete','complete','46533','3',50,8.16,'all out','59339','4',33.1,4.55,'3','49626','39157','49665','4922','13414','656445','656453');
INSERT INTO matches VALUES(18,'AUS','28-FEB-2015','283','NZ','day/night match',656437,'20th Match, Pool A','NZ',NULL,'New Zealand won by 1 wicket (with 161 balls remaining)','complete','target reached','10384','5',23.1,6.56,'all out','8876','2',32.2,4.67,'2','9230','44449','33135','44971','15383','656459','656449');
INSERT INTO matches VALUES(19,'UAE','28-FEB-2015','213','UAE','day/night match',656439,'21st Match, Pool B','INDIA',NULL,'India won by 9 wickets (with 187 balls remaining)','complete','target reached','7593','6',18.5,5.52,'all out','47712','27',31.3,3.23,'27','49623','48469','16314','36339','13413','656453','656447');
INSERT INTO matches VALUES(20,'ENG','1-MAR-2015','1166','SL','day match',656441,'22nd Match, Pool A','SL',NULL,'Sri Lanka won by 9 wickets (with 16 balls remaining)','complete','complete','47055','1',50,6.18,'target reached','47023','8',47.2,6.59,'1','4169','5341','37097','7029','7986','656463','656461');
INSERT INTO matches VALUES(21,'PAK','1-MAR-2015','209','ZIM','day/night match',656443,'23rd Match, Pool B','PAK',NULL,'Pakistan won by 20 runs','complete','complete','19596','7',50,4.7,'all out','45252','9',49.4,4.32,'7','36620','50159','7326','15872','387601','656447','656457');
INSERT INTO matches VALUES(22,'SA','3-MAR-2015','757','SA','day/night match',656445,'24th Match, Pool B','SA',NULL,'South Africa won by 201 runs','complete','all out','47403','29',45,4.66,'complete','46533','3',50,8.22,'3','49626','39157','13414','4922','49665','656457','656455');
INSERT INTO matches VALUES(23,'PAK','4-MAR-2015','453','UAE','day/night match',656447,'25th Match, Pool B','PAK',NULL,'Pakistan won by 129 runs','complete','complete','19596','7',50,6.78,'complete','47712','27',50,4.2,'27','9230','44971','15383','44449','33135','656455','656469');
INSERT INTO matches VALUES(24,'AUS','4-MAR-2015','213','AUS','day/night match',656449,'26th Match, Pool A','AUS',NULL,'Australia won by 275 runs','complete','complete','8876','2',50,8.34,'all out','46888','40',37.3,3.78,'40','49623','16314','36339','48469','13413','656461','656459');
INSERT INTO matches VALUES(25,'SCOT','5-MAR-2015','2480','SCOT','day match',656451,'27th Match, Pool A','BDESH',NULL,'Bangladesh won by 6 wickets (with 11 balls remaining)','complete','target reached','24672','25',48.1,6.68,'complete','62583','30',50,6.36,'25','4169','37097','7986','5341','7029','656463','656467');
INSERT INTO matches VALUES(26,'WI','6-MAR-2015','213','WI','day/night match',656453,'28th Match, Pool B','INDIA',NULL,'India won by 4 wickets (with 65 balls remaining)','complete','target reached','7593','6',39.1,4.72,'all out','59339','4',44.2,4.1,'4','49623','13413','36339','48469','16314','656465','656479');
INSERT INTO matches VALUES(27,'PAK','7-MAR-2015','283','SA','day/night match',656455,'29th Match, Pool B','PAK','D/L method','Pakistan won by 29 runs (D/L method)','complete','all out','19596','7',46.4,4.75,'all out','46533','3',33.3,6.02,'3','9230','33135','37097','15872','7029','656481','656469');
INSERT INTO matches VALUES(28,'IRE','7-MAR-2015','905','ZIM','day/night match',656457,'30th Match, Pool B','IRE',NULL,'Ireland won by 5 runs','complete','complete','47403','29',50,6.62,'all out','45253','9',49.3,6.58,'9','49626','49665','387601','50159','7326','656465','656475');
INSERT INTO matches VALUES(29,'AFG','8-MAR-2015','453','NZ','day match',656459,'31st Match, Pool A','NZ',NULL,'New Zealand won by 6 wickets (with 83 balls remaining)','complete','target reached','10384','5',36.1,5.19,'all out','46888','40',47.4,3.9,'40','4169','7986','4922','44449','44971','656471','656473');
INSERT INTO matches VALUES(30,'AUS','8-MAR-2015','132','AUS','day/night match',656461,'32nd Match, Pool A','AUS',NULL,'Australia won by 64 runs','complete','complete','8876','2',50,7.52,'all out','47023','8',46.2,6.73,'2','36620','13413','15383','39157','13414','656477','656467');
INSERT INTO matches VALUES(31,'BDESH','9-MAR-2015','131','ENG','day/night match',656463,'33rd Match, Pool A','BDESH',NULL,'Bangladesh won by 15 runs','complete','complete','24672','25',50,5.5,'all out','47055','1',48.3,5.36,'1','49623','49665','5341','36339','7326','656471','656473');
INSERT INTO matches VALUES(32,'IRE','10-MAR-2015','504','IRE','day/night match',656465,'34th Match, Pool B','INDIA',NULL,'India won by 8 wickets (with 79 balls remaining)','complete','target reached','7593','6',36.5,7.05,'all out','47403','29',49,5.28,'29','9230','16314','44449','48469','15872','656475','656481');
INSERT INTO matches VALUES(33,'SL','11-MAR-2015','905','SL','day/night match',656467,'35th Match, Pool A','SL',NULL,'Sri Lanka won by 148 runs','complete','all out','62583','30',43.1,4.98,'complete','47023','8',50,7.26,'8','36620','13414','13413','15383','387601','656477','656483');
INSERT INTO matches VALUES(34,'SA','12-MAR-2015','1166','UAE','day/night match',656469,'36th Match, Pool B','SA',NULL,'South Africa won by 146 runs','complete','complete','46533','3',50,6.82,'all out','47712','27',47.3,4.1,'27','49626','39157','7029','4922','7986','656483','656479');
INSERT INTO matches VALUES(35,'BDESH','13-MAR-2015','504','NZ','day/night match',656471,'37th Match, Pool A','NZ',NULL,'New Zealand won by 3 wickets (with 7 balls remaining)','complete','target reached','10384','5',48.5,5.93,'complete','48277','25',50,5.76,'5','9230','44449','16314','48469','15872','656489','656485');
INSERT INTO matches VALUES(36,'AFG','13-MAR-2015','132','ENG','day/night match',656473,'38th Match, Pool A','ENG','D/L method','England won by 9 wickets (with 41 balls remaining) (D/L method)','complete','complete','46888','40',36.2,3.05,'target reached','47055','1',18.1,5.55,'1','4169','50159','44971','36339','33135',NULL,NULL);
INSERT INTO matches VALUES(37,'ZIM','14-MAR-2015','283','ZIM','day/night match',656475,'39th Match, Pool B','INDIA',NULL,'India won by 6 wickets (with 8 balls remaining)','complete','target reached','7593','6',48.4,5.91,'all out','45253','9',48.5,5.87,'6','49626','4922','7986','37097','7029','656485','');
INSERT INTO matches VALUES(38,'SCOT','14-MAR-2015','905','AUS','day/night match',656477,'40th Match, Pool A','AUS',NULL,'Australia won by 7 wickets (with 208 balls remaining)','complete','target reached','8876','2',15.2,8.67,'all out','62583','30',25.4,5.06,'2','36620','13413','387601','13414','15383','656487','');
INSERT INTO matches VALUES(39,'UAE','15-MAR-2015','453','WI','day match',656479,'41st Match, Pool B','WI',NULL,'West Indies won by 6 wickets (with 117 balls remaining)','complete','all out','47712','27',47.4,3.67,'target reached','59339','4',30.3,5.77,'4','9230','48469','15872','39157','49665','','656489');
INSERT INTO matches VALUES(40,'IRE','15-MAR-2015','131','PAK','day/night match',656481,'42nd Match, Pool B','PAK',NULL,'Pakistan won by 7 wickets (with 23 balls remaining)','complete','all out','47403','29',50,4.74,'target reached','19596','7',46.1,5.22,'29','49623','7326','5341','44971','50159','','656487');
INSERT INTO matches VALUES(41,'SL','18-MAR-2015','132','SL','day/night match',656483,'1st Quarter-Final','SA',NULL,'South Africa won by 9 wickets (with 192 balls remaining)','complete','target reached','46533','3',18,7.44,'all out','47023','8',37.2,3.56,'8','4169','7029','15872','16314','7986','656491','');
INSERT INTO matches VALUES(42,'INDIA','19-MAR-2015','61','INDIA','day/night match',656485,'2nd Quarter-Final','INDIA',NULL,'India won by 109 runs','complete','all out','24672','25',45,4.28,'complete','7593','6',50,6.04,'6','49626','7326','4922','39157','13414',NULL,'656493');
INSERT INTO matches VALUES(43,'PAK','20-MAR-2015','131','AUS','day/night match',656487,'3rd Quarter-Final','AUS',NULL,'Australia won by 6 wickets (with 97 balls remaining)','complete','target reached','8876','2',33.5,6.38,'all out','19596','7',49.5,4.27,'7','49623','36339','15383','48469','44971','656493','');
INSERT INTO matches VALUES(44,'NZ','21-MAR-2015','1166','NZ','day/night match',656489,'4th Quarter-Final','NZ',NULL,'New Zealand won by 143 runs','complete','complete','10384','5',50,7.86,'all out','59339','4',30.3,8.19,'5','9230','16314','7986','15872','7029','656491','');
INSERT INTO matches VALUES(45,'SA','24-MAR-2015','283','NZ','day/night match',656491,'1st Semi-Final','NZ','D/L method','New Zealand won by 4 wickets (with 1 ball remaining) (D/L method)','complete','target reached','10384','5',42.5,6.98,'complete','46533','3',43,6.53,'3','4169','7029','16314','13414','7986','656495','');
INSERT INTO matches VALUES(46,'AUS','26-MAR-2015','132','AUS','day/night match',656493,'2nd Semi-Final','AUS',NULL,'Australia won by 95 runs','complete','complete','8876','2',50,6.56,'all out','7593','6',46.5,4.97,'2','49623','15383','44971','48469','15872','656495','');
INSERT INTO matches VALUES(47,'NZ','29-MAR-2015','61','AUS','day/night match',656495,'Final','AUS',NULL,'Australia won by 7 wickets (with 101 balls remaining)','complete','target reached','8876','2',33.1,5.6,'all out','10384','5',45,4.06,'5','49623','13414','44971','48469','15872',NULL,NULL);

INSERT INTO grounds VALUES(0,'93','Hagley Oval, Christchurch','Oceania','','Christchurch','824');
INSERT INTO grounds VALUES(1,'61','Melbourne Cricket Ground','Oceania','Victoria','Melbourne','25');
INSERT INTO grounds VALUES(2,'504','Seddon Park, Hamilton','Oceania','','Hamilton','827');
INSERT INTO grounds VALUES(3,'131','Adelaide Oval','Oceania','South Australia','Adelaide','2');
INSERT INTO grounds VALUES(4,'2480','Saxton Oval, Nelson','Oceania','','Nelson','837');
INSERT INTO grounds VALUES(5,'769','University Oval, Dunedin','Oceania','','Dunedin','825');
INSERT INTO grounds VALUES(6,'757','Manuka Oval, Canberra','Oceania','Australian Capital Territory','Canberra','13');
INSERT INTO grounds VALUES(8,'1166','Westpac Stadium, Wellington','Oceania','','Wellington','851');
INSERT INTO grounds VALUES(14,'209','Brisbane Cricket Ground, Woolloongabba, Brisbane','Oceania','Queensland','Brisbane','8');
INSERT INTO grounds VALUES(17,'132','Sydney Cricket Ground','Oceania','New South Wales','Sydney','29');
INSERT INTO grounds VALUES(18,'283','Eden Park, Auckland','Oceania','','Auckland','822');
INSERT INTO grounds VALUES(19,'213','Western Australia Cricket Association Ground, Perth','Oceania','Western Australia','Perth','27');
INSERT INTO grounds VALUES(23,'453','McLean Park, Napier','Oceania','','Napier','836');
INSERT INTO grounds VALUES(28,'905','Bellerive Oval, Hobart','Oceania','Tasmania','Hobart','20');

INSERT INTO officials VALUES(0,'50',TO_DATE('1964-02-27','YYYY-MM-DD'),'Marais Erasmus','44971','South Africa');
INSERT INTO officials VALUES(1,'46',TO_DATE('1968-06-06','YYYY-MM-DD'),'Aleem Dar','39157','Pakistan');
INSERT INTO officials VALUES(2,'47',TO_DATE('1967-06-24','YYYY-MM-DD'),'Ranmore Martinesz','49665','Sri Lanka');
INSERT INTO officials VALUES(3,'57',TO_DATE('1957-08-19','YYYY-MM-DD'),'Ian Gould','13414','England');
INSERT INTO officials VALUES(4,'51',TO_DATE('1963-08-23','YYYY-MM-DD'),'Richard Illingworth','15383','England');
INSERT INTO officials VALUES(5,'48',TO_DATE('1966-07-29','YYYY-MM-DD'),'Simon Fry','5341','Australia');
INSERT INTO officials VALUES(6,'62',TO_DATE('1952-04-09','YYYY-MM-DD'),'Steve Davis','4922','Australia');
INSERT INTO officials VALUES(7,'43',TO_DATE('1971-07-21','YYYY-MM-DD'),'Johan Cloete','44449','South Africa');
INSERT INTO officials VALUES(8,'48',TO_DATE('1966-04-19','YYYY-MM-DD'),'Paul Reiffel','7326','Australia');
INSERT INTO officials VALUES(10,'39',TO_DATE('1975-11-30','YYYY-MM-DD'),'Chris Gaffaney','37097','New Zealand');
INSERT INTO officials VALUES(12,'48',TO_DATE('1966-04-22','YYYY-MM-DD'),'Sundaram Ravi','33135','India');
INSERT INTO officials VALUES(14,'35',TO_DATE('1979-12-18','YYYY-MM-DD'),'Michael Gough','13413','England');
INSERT INTO officials VALUES(18,'51',TO_DATE('1964-02-27','YYYY-MM-DD'),'Marais Erasmus','44971','South Africa');
INSERT INTO officials VALUES(19,'51',TO_DATE('1963-04-11','YYYY-MM-DD'),'Billy Bowden','36339','New Zealand');
INSERT INTO officials VALUES(20,'54',TO_DATE('1960-03-05','YYYY-MM-DD'),'Bruce Oxenford','7029','Australia');
INSERT INTO officials VALUES(21,'41',TO_DATE('1973-03-15','YYYY-MM-DD'),'Richard Kettleborough','15872','England');
INSERT INTO officials VALUES(24,'43',TO_DATE('1971-04-24','YYYY-MM-DD'),'Kumar Dharmasena','48469','Sri Lanka');
INSERT INTO officials VALUES(28,'47',TO_DATE('1968-01-22','YYYY-MM-DD'),'Ruchira Palliyaguruge','50159','Sri Lanka');
INSERT INTO officials VALUES(41,'46',TO_DATE('1969-02-11','YYYY-MM-DD'),'Nigel Llong','16314','England');
INSERT INTO officials VALUES(44,'42',TO_DATE('1973-03-15','YYYY-MM-DD'),'Richard Kettleborough','15872','England');
INSERT INTO officials VALUES(50,'50',TO_DATE('1964-08-28','YYYY-MM-DD'),'Rod Tucker','7986','Australia');
INSERT INTO officials VALUES(54,'48',TO_DATE('1966-12-30','YYYY-MM-DD'),'Joel Wilson','387601','West Indies');
INSERT INTO officials VALUES(73,'55',TO_DATE('1960-03-05','YYYY-MM-DD'),'Bruce Oxenford','7029','Australia');
INSERT INTO officials VALUES(144,'54',TO_DATE('1960-12-29','YYYY-MM-DD'),'David Boon','4169','Australia');
INSERT INTO officials VALUES(145,'56',TO_DATE('1958-09-14','YYYY-MM-DD'),'Jeff Crowe','36620','New Zealand');
INSERT INTO officials VALUES(146,'48',TO_DATE('1966-05-31','YYYY-MM-DD'),'Roshan Mahanama','49626','Sri Lanka');
INSERT INTO officials VALUES(147,'55',TO_DATE('1959-04-22','YYYY-MM-DD'),'Ranjan Madugalle','49623','Sri Lanka');
INSERT INTO officials VALUES(148,'57',TO_DATE('1957-09-29','YYYY-MM-DD'),'Chris Broad','9230','England');

INSERT INTO teams VALUES(12,1,'ENG');
INSERT INTO teams VALUES(1,2,'AUS');
INSERT INTO teams VALUES(2,3,'SA');
INSERT INTO teams VALUES(13,4,'WI');
INSERT INTO teams VALUES(0,5,'NZ');
INSERT INTO teams VALUES(3,6,'INDIA');
INSERT INTO teams VALUES(9,7,'PAK');
INSERT INTO teams VALUES(48,8,'SL');
INSERT INTO teams VALUES(50,9,'ZIM');
INSERT INTO teams VALUES(16,25,'BDESH');
INSERT INTO teams VALUES(7,27,'UAE');
INSERT INTO teams VALUES(4,29,'IRE');
INSERT INTO teams VALUES(33,30,'SCOT');
INSERT INTO teams VALUES(6,40,'AFG');



INSERT INTO players VALUES(99999,TO_DATE ('1989-05-04','YYYY-MM-DD'),'99999','David Ebert','total fraud','62'); 
	-- The above fake row is included test the check constraint on team_id for players table
INSERT INTO players VALUES(0,TO_DATE ('1986-9-30','YYYY-MM-DD'),'48927','Martin Guptill','opening batsman','5');
INSERT INTO players VALUES(1,TO_DATE ('1986-10-27','YYYY-MM-DD'),'48739','David Warner','opening batsman','2');
INSERT INTO players VALUES(2,TO_DATE ('1992-12-17','YYYY-MM-DD'),'58406','Quinton de Kock','wicketkeeper batsman','3');
INSERT INTO players VALUES(3,TO_DATE ('1987-04-30','YYYY-MM-DD'),'48405','Rohit Sharma','middle-order batsman','6');
INSERT INTO players VALUES(4,TO_DATE ('1984-09-06','YYYY-MM-DD'),'47403','William Porterfield','opening batsman','29');
INSERT INTO players VALUES(6,TO_DATE ('1992-01-02','YYYY-MM-DD'),'53112','Javed Ahmadi','top-order batsman','40');
INSERT INTO players VALUES(7,TO_DATE ('1979-09-25','YYYY-MM-DD'),'46491','Amjad Ali','batsman','27');
INSERT INTO players VALUES(9,TO_DATE ('1989-12-06','YYYY-MM-DD'),'48293','Nasir Jamshed','opening batsman','7');
INSERT INTO players VALUES(12,TO_DATE ('1987-06-18','YYYY-MM-DD'),'46597','Moeen Ali','batting allrounder','1');
INSERT INTO players VALUES(13,TO_DATE ('1983-04-12','YYYY-MM-DD'),'45554','Dwayne Smith','allrounder','4');
INSERT INTO players VALUES(16,TO_DATE ('1989-03-20','YYYY-MM-DD'),'48391','Tamim Iqbal','opening batsman','25');
INSERT INTO players VALUES(27,TO_DATE ('1987-05-22','YYYY-MM-DD'),'48983','Sarfraz Ahmed','wicketkeeper batsman','7');
INSERT INTO players VALUES(30,TO_DATE ('1986-11-17','YYYY-MM-DD'),'35812','Aaron Finch','top-order batsman','2');
INSERT INTO players VALUES(33,TO_DATE ('1984-04-14','YYYY-MM-DD'),'46048','Kyle Coetzer','top-order batsman','30');
INSERT INTO players VALUES(34,TO_DATE ('1983-03-31','YYYY-MM-DD'),'9952','Hashim Amla','top-order batsman','3');
INSERT INTO players VALUES(38,TO_DATE ('1981-04-02','YYYY-MM-DD'),'8876','Michael Clarke','middle-order batsman','2');
INSERT INTO players VALUES(48,TO_DATE ('1981-09-27','YYYY-MM-DD'),'10384','Brendon McCullum','wicketkeeper batsman','5');
INSERT INTO players VALUES(51,TO_DATE ('1985-12-05','YYYY-MM-DD'),'15887','Shikhar Dhawan','opening batsman','6');
INSERT INTO players VALUES(52,TO_DATE ('1990-09-03','YYYY-MM-DD'),'52631','Paul Stirling','allrounder','29');
INSERT INTO players VALUES(54,TO_DATE ('1993-08-10','YYYY-MM-DD'),'60460','Afsar Zazai','wicketkeeper batsman','40');
INSERT INTO players VALUES(55,TO_DATE ('1991-08-29','YYYY-MM-DD'),'58893','Andri Berenger','opening batsman','27');
INSERT INTO players VALUES(57,TO_DATE ('1991-11-23','YYYY-MM-DD'),'49899','Ahmed Shehzad','opening batsman','7');
INSERT INTO players VALUES(58,TO_DATE ('1984-07-15','YYYY-MM-DD'),'53602','Nawroz Mangal','top-order batsman','40');
INSERT INTO players VALUES(60,TO_DATE ('1982-04-11','YYYY-MM-DD'),'7822','Ian Bell','top-order batsman','1');
INSERT INTO players VALUES(61,TO_DATE ('1979-09-21','YYYY-MM-DD'),'7568','Chris Gayle','allrounder','4');
INSERT INTO players VALUES(64,TO_DATE ('1992-12-16','YYYY-MM-DD'),'58536','Anamul Haque','wicketkeeper batsman','25');
INSERT INTO players VALUES(73,TO_DATE ('1993-02-25','YYYY-MM-DD'),'61619','Soumya Sarkar','middle-order batsman','25');
INSERT INTO players VALUES(79,TO_DATE ('1987-02-02','YYYY-MM-DD'),'51239','Imrul Kayes','opening batsman','25');
INSERT INTO players VALUES(81,TO_DATE ('1988-11-15','YYYY-MM-DD'),'49112','Calum MacLeod','top-order batsman','30');
INSERT INTO players VALUES(96,TO_DATE ('1990-08-08','YYYY-MM-DD'),'51088','Kane Williamson','top-order batsman','5');
INSERT INTO players VALUES(97,TO_DATE ('1981-06-17','YYYY-MM-DD'),'10125','Shane Watson','allrounder','2');
INSERT INTO players VALUES(98,TO_DATE ('1984-07-13','YYYY-MM-DD'),'46933','Faf du Plessis','middle-order batsman','3');
INSERT INTO players VALUES(99,TO_DATE ('1988-11-05','YYYY-MM-DD'),'49752','Virat Kohli','middle-order batsman','6');
INSERT INTO players VALUES(100,TO_DATE ('1978-09-22','YYYY-MM-DD'),'7233','Ed Joyce','top-order batsman','29');
INSERT INTO players VALUES(103,TO_DATE ('1984-08-24','YYYY-MM-DD'),'51466','Krishna Chandran','allrounder','27');
INSERT INTO players VALUES(105,TO_DATE ('1977-11-29','YYYY-MM-DD'),'10439','Younis Khan','middle-order batsman','7');
INSERT INTO players VALUES(106,TO_DATE ('1987-12-22','YYYY-MM-DD'),'53809','Asghar Stanikzai','middle-order batsman','40');
INSERT INTO players VALUES(108,TO_DATE ('1989-11-22','YYYY-MM-DD'),'49115','Gary Ballance','middle-order batsman','1');
INSERT INTO players VALUES(109,TO_DATE ('1981-02-05','YYYY-MM-DD'),'10238','Marlon Samuels','top-order batsman','4');
INSERT INTO players VALUES(117,TO_DATE ('1989-01-09','YYYY-MM-DD'),'53639','Haris Sohail','middle-order batsman','7');
INSERT INTO players VALUES(120,TO_DATE ('1989-06-02','YYYY-MM-DD'),'50281','Steven Smith','allrounder','2');
INSERT INTO players VALUES(121,TO_DATE ('1986-02-04','YYYY-MM-DD'),'47352','Mahmudullah','allrounder','25');
INSERT INTO players VALUES(129,TO_DATE ('1991-02-15','YYYY-MM-DD'),'52184','Matt Machan','top-order batsman','30');
INSERT INTO players VALUES(130,TO_DATE ('1989-10-09','YYYY-MM-DD'),'53649','Rilee Rossouw','top-order batsman','3');
INSERT INTO players VALUES(144,TO_DATE ('1984-03-08','YYYY-MM-DD'),'44930','Ross Taylor','middle-order batsman','5');
INSERT INTO players VALUES(146,TO_DATE ('1984-02-17','YYYY-MM-DD'),'46533','AB de Villiers','wicketkeeper batsman','3');
INSERT INTO players VALUES(147,TO_DATE ('1986-11-27','YYYY-MM-DD'),'15716','Suresh Raina','middle-order batsman','6');
INSERT INTO players VALUES(148,TO_DATE ('1981-11-08','YYYY-MM-DD'),'10351','Niall O''Brien','wicketkeeper batsman','29');
INSERT INTO players VALUES(151,TO_DATE ('1971-06-21','YYYY-MM-DD'),'36602','Khurram Khan','top-order batsman','27');
INSERT INTO players VALUES(154,TO_DATE ('1987-02-03','YYYY-MM-DD'),'53605','Samiullah Shenwari','allrounder','40');
INSERT INTO players VALUES(155,TO_DATE ('1988-06-06','YYYY-MM-DD'),'51096','Ajinkya Rahane','top-order batsman','6');
INSERT INTO players VALUES(156,TO_DATE ('1990-12-30','YYYY-MM-DD'),'52656','Joe Root','top-order batsman','1');
INSERT INTO players VALUES(157,TO_DATE ('1987-11-16','YYYY-MM-DD'),'53389','Jonathan Carter','allrounder','4');
INSERT INTO players VALUES(160,TO_DATE ('1991-09-29','YYYY-MM-DD'),'58225','Mominul Haque','middle-order batsman','25');
INSERT INTO players VALUES(165,TO_DATE ('1974-05-28','YYYY-MM-DD'),'19596','Misbah-ul-Haq','middle-order batsman','7');
INSERT INTO players VALUES(167,TO_DATE ('1987-04-15','YYYY-MM-DD'),'47686','Sohaib Maqsood','middle-order batsman','7');
INSERT INTO players VALUES(168,TO_DATE ('1988-10-14','YYYY-MM-DD'),'54222','Glenn Maxwell','batting allrounder','2');
INSERT INTO players VALUES(169,TO_DATE ('1987-06-09','YYYY-MM-DD'),'47986','Mushfiqur Rahim','wicketkeeper batsman','25');
INSERT INTO players VALUES(172,TO_DATE ('1990-12-28','YYYY-MM-DD'),'52628','Andy Balbirnie','opening batsman','29');
INSERT INTO players VALUES(177,TO_DATE ('1987-10-14','YYYY-MM-DD'),'62583','Preston Mommsen','opening batsman','30');
INSERT INTO players VALUES(180,TO_DATE ('1993-12-21','YYYY-MM-DD'),'65860','Nasir Jamal','middle-order batsman','40');
INSERT INTO players VALUES(182,TO_DATE ('1990-04-29','YYYY-MM-DD'),'50483','James Faulkner','bowling allrounder','2');
INSERT INTO players VALUES(192,TO_DATE ('1979-03-21','YYYY-MM-DD'),'6329','Grant Elliott','allrounder','5');
INSERT INTO players VALUES(193,TO_DATE ('1982-09-07','YYYY-MM-DD'),'35384','George Bailey','top-order batsman','2');
INSERT INTO players VALUES(194,TO_DATE ('1989-06-10','YYYY-MM-DD'),'53891','David Miller','middle-order batsman','3');
INSERT INTO players VALUES(195,TO_DATE ('1981-07-07','YYYY-MM-DD'),'7593','MS Dhoni','wicketkeeper batsman','6');
INSERT INTO players VALUES(199,TO_DATE ('1985-04-15','YYYY-MM-DD'),'62044','Swapnil Patil','wicketkeeper batsman','27');
INSERT INTO players VALUES(202,TO_DATE ('1985-01-01','YYYY-MM-DD'),'46888','Mohammad Nabi','allrounder','40');
INSERT INTO players VALUES(204,TO_DATE ('1986-09-10','YYYY-MM-DD'),'47055','Eoin Morgan','middle-order batsman','1');
INSERT INTO players VALUES(205,TO_DATE ('1985-03-13','YYYY-MM-DD'),'47111','Denesh Ramdin','wicketkeeper batsman','4');
INSERT INTO players VALUES(213,TO_DATE ('1990-05-26','YYYY-MM-DD'),'53546','Umar Akmal','middle-order batsman','7');
INSERT INTO players VALUES(217,TO_DATE ('1987-03-24','YYYY-MM-DD'),'48277','Shakib Al Hasan','allrounder','25');
INSERT INTO players VALUES(220,TO_DATE ('1984-03-04','YYYY-MM-DD'),'47397','Kevin O''Brien','allrounder','29');
INSERT INTO players VALUES(225,TO_DATE ('1991-12-15','YYYY-MM-DD'),'57777','Freddie Coleman','opening batsman','30');
INSERT INTO players VALUES(231,TO_DATE ('1979-03-15','YYYY-MM-DD'),'45742','Shaiman Anwar','top-order batsman','27');
INSERT INTO players VALUES(236,TO_DATE ('1990-12-13','YYYY-MM-DD'),'51057','Corey Anderson','batting allrounder','5');
INSERT INTO players VALUES(242,TO_DATE ('1984-04-14','YYYY-MM-DD'),'45222','Jean-Paul Duminy','batting allrounder','3');
INSERT INTO players VALUES(243,TO_DATE ('1988-12-06','YYYY-MM-DD'),'49247','Ravindra Jadeja','allrounder','6');
INSERT INTO players VALUES(244,TO_DATE ('1986-02-05','YYYY-MM-DD'),'47401','Gary Wilson','wicketkeeper batsman','29');
INSERT INTO players VALUES(250,TO_DATE ('1993-02-28','YYYY-MM-DD'),'65861','Najibullah Zadran','middle-order batsman','40');
INSERT INTO players VALUES(252,TO_DATE ('1990-01-06','YYYY-MM-DD'),'52246','James Taylor','middle-order batsman','1');
INSERT INTO players VALUES(253,TO_DATE ('1985-01-25','YYYY-MM-DD'),'45256','Lendl Simmons','top-order batsman','4');
INSERT INTO players VALUES(261,TO_DATE ('1980-03-01','YYYY-MM-DD'),'4169','Shahid Afridi','allrounder','7');
INSERT INTO players VALUES(264,TO_DATE ('1991-10-20','YYYY-MM-DD'),'50771','Mitchell Marsh','top-order batsman','2');
INSERT INTO players VALUES(265,TO_DATE ('1991-11-22','YYYY-MM-DD'),'58220','Sabbir Rahman','middle-order batsman','25');
INSERT INTO players VALUES(273,TO_DATE ('1987-04-03','YYYY-MM-DD'),'48469','Richie Berrington','top-order batsman','30');
INSERT INTO players VALUES(276,TO_DATE ('1989-08-07','YYYY-MM-DD'),'57628','Shafiqullah','wicketkeeper batsman','40');
INSERT INTO players VALUES(288,TO_DATE ('1981-04-23','YYYY-MM-DD'),'17850','Luke Ronchi','wicketkeeper batsman','5');
INSERT INTO players VALUES(290,TO_DATE ('1983-10-09','YYYY-MM-DD'),'48148','Farhaan Behardien','batting allrounder','3');
INSERT INTO players VALUES(295,TO_DATE ('1988-10-07','YYYY-MM-DD'),'53033','Rohan Mustafa','middle-order batsman','27');
INSERT INTO players VALUES(300,TO_DATE ('1990-09-08','YYYY-MM-DD'),'53271','Jos Buttler','wicketkeeper batsman','1');
INSERT INTO players VALUES(301,TO_DATE ('1983-12-20','YYYY-MM-DD'),'44829','Darren Sammy','allrounder','4');
INSERT INTO players VALUES(312,TO_DATE ('1977-10-23','YYYY-MM-DD'),'6426','Brad Haddin','wicketkeeper batsman','2');
INSERT INTO players VALUES(316,TO_DATE ('1982-02-10','YYYY-MM-DD'),'10345','John Mooney','allrounder','29');
INSERT INTO players VALUES(321,TO_DATE ('1990-10-29','YYYY-MM-DD'),'60198','Michael Leask','allrounder','30');
INSERT INTO players VALUES(327,TO_DATE ('1980-07-05','YYYY-MM-DD'),'48412','Amjad Javed','allrounder','27');
INSERT INTO players VALUES(336,TO_DATE ('1979-01-27','YYYY-MM-DD'),'4380','Daniel Vettori','allrounder','5');
INSERT INTO players VALUES(338,TO_DATE ('1985-06-24','YYYY-MM-DD'),'46935','Vernon Philander','allrounder','3');
INSERT INTO players VALUES(339,TO_DATE ('1986-09-17','YYYY-MM-DD'),'12894','Ravichandran Ashwin','bowling allrounder','6');
INSERT INTO players VALUES(342,TO_DATE ('1988-06-30','YYYY-MM-DD'),'59061','Mirwais Ashraf','bowler','40');
INSERT INTO players VALUES(348,TO_DATE ('1989-03-02','YYYY-MM-DD'),'49496','Chris Woakes','bowler','1');
INSERT INTO players VALUES(349,TO_DATE ('1988-04-29','YYYY-MM-DD'),'51012','Andre Russell','allrounder','4');
INSERT INTO players VALUES(351,TO_DATE ('1991-03-16','YYYY-MM-DD'),'57022','Gulbadin Naib','bowler','40');
INSERT INTO players VALUES(353,TO_DATE ('1983-06-27','YYYY-MM-DD'),'47154','Dale Steyn','bowler','3');
INSERT INTO players VALUES(357,TO_DATE ('1985-06-28','YYYY-MM-DD'),'24723','Wahab Riaz','bowler','7');
INSERT INTO players VALUES(361,TO_DATE ('1991-11-30','YYYY-MM-DD'),'52363','Nasir Hossain','allrounder','25');
INSERT INTO players VALUES(367,TO_DATE ('1983-10-05','YYYY-MM-DD'),'24672','Mashrafe Mortaza','bowler','25');
INSERT INTO players VALUES(369,TO_DATE ('1992-10-15','YYYY-MM-DD'),'60303','Matthew Cross','wicketkeeper batsman','30');
INSERT INTO players VALUES(375,TO_DATE ('1986-06-16','YYYY-MM-DD'),'62028','Nasir Aziz','bowler','27');
INSERT INTO players VALUES(376,TO_DATE ('1991-08-15','YYYY-MM-DD'),'60195','Stuart Thompson','bowler','29');
INSERT INTO players VALUES(384,TO_DATE ('1988-12-11','YYYY-MM-DD'),'49108','Tim Southee','bowler','5');
INSERT INTO players VALUES(385,TO_DATE ('1981-11-02','YYYY-MM-DD'),'10130','Mitchell Johnson','bowler','2');
INSERT INTO players VALUES(387,TO_DATE ('1990-09-03','YYYY-MM-DD'),'63646','Mohammed Shami','bowler','6');
INSERT INTO players VALUES(388,TO_DATE ('1985-11-18','YYYY-MM-DD'),'66284','Max Sorensen','bowler','29');
INSERT INTO players VALUES(389,TO_DATE ('1992-04-13','YYYY-MM-DD'),'62153','Adam Milne','bowler','5');
INSERT INTO players VALUES(390,TO_DATE ('1992-11-30','YYYY-MM-DD'),'61857','Aftab Alam','bowler','40');
INSERT INTO players VALUES(391,TO_DATE ('1987-06-03','YYYY-MM-DD'),'66386','Mohammad Naveed','bowler','27');
INSERT INTO players VALUES(394,TO_DATE ('1988-03-19','YYYY-MM-DD'),'65399','Dawlat Zadran','bowler','40');
INSERT INTO players VALUES(396,TO_DATE ('1986-06-24','YYYY-MM-DD'),'48440','Stuart Broad','bowler','1');
INSERT INTO players VALUES(397,TO_DATE ('1991-11-05','YYYY-MM-DD'),'59339','Jason Holder','bowling allrounder','4');
INSERT INTO players VALUES(398,TO_DATE ('1980-10-29','YYYY-MM-DD'),'51559','Alex Cusack','bowler','29');
INSERT INTO players VALUES(401,TO_DATE ('1987-06-18','YYYY-MM-DD'),'52222','Kyle Abbott','bowler','3');
INSERT INTO players VALUES(403,TO_DATE ('1990-02-05','YYYY-MM-DD'),'54282','Bhuvneshwar Kumar','bowler','6');
INSERT INTO players VALUES(405,TO_DATE ('1984-03-06','YYYY-MM-DD'),'53540','Sohail Khan','bowler','7');
INSERT INTO players VALUES(406,TO_DATE ('1992-07-22','YYYY-MM-DD'),'56811','George Dockrell','bowler','29');
INSERT INTO players VALUES(410,TO_DATE ('1988-09-18','YYYY-MM-DD'),'66722','Mohit Sharma','bowler','6');
INSERT INTO players VALUES(415,TO_DATE ('1986-09-29','YYYY-MM-DD'),'45560','Arafat Sunny','bowler','25');
INSERT INTO players VALUES(417,TO_DATE ('1989-12-21','YYYY-MM-DD'),'57140','Rob Taylor','allrounder','30');
INSERT INTO players VALUES(420,TO_DATE ('1987-06-01','YYYY-MM-DD'),'53326','Hamid Hassan','bowler','40');
INSERT INTO players VALUES(428,TO_DATE ('1989-07-22','YYYY-MM-DD'),'51092','Trent Boult','bowler','5');
INSERT INTO players VALUES(429,TO_DATE ('1991-12-14','YYYY-MM-DD'),'64947','Matt Henry','bowler','5');
INSERT INTO players VALUES(433,TO_DATE ('1990-01-30','YYYY-MM-DD'),'53330','Mitchell Starc','bowler','2');
INSERT INTO players VALUES(434,TO_DATE ('1979-03-27','YYYY-MM-DD'),'19422','Imran Tahir','bowler','3');
INSERT INTO players VALUES(435,TO_DATE ('1987-10-25','YYYY-MM-DD'),'58274','Umesh Yadav','bowler','6');
INSERT INTO players VALUES(439,TO_DATE ('1972-01-14','YYYY-MM-DD'),'47712','Mohammad Tauqir','bowler','27');
INSERT INTO players VALUES(444,TO_DATE ('1989-04-04','YYYY-MM-DD'),'48529','Steven Finn','bowler','1');
INSERT INTO players VALUES(445,TO_DATE ('1984-06-22','YYYY-MM-DD'),'46591','Jerome Taylor','bowler','4');
INSERT INTO players VALUES(448,TO_DATE ('1990-01-01','YYYY-MM-DD'),'52364','Rubel Hossain','bowler','25');
INSERT INTO players VALUES(449,TO_DATE ('1984-10-06','YYYY-MM-DD'),'47289','Morne Morkel','bowler','3');
INSERT INTO players VALUES(453,TO_DATE ('1988-09-12','YYYY-MM-DD'),'54013','Rahat Ali','bowler','7');
INSERT INTO players VALUES(465,TO_DATE ('1990-08-03','YYYY-MM-DD'),'59951','Josh Davey','allrounder','30');
INSERT INTO players VALUES(481,TO_DATE ('1991-01-08','YYYY-MM-DD'),'51367','Josh Hazlewood','bowler','2');
INSERT INTO players VALUES(484,TO_DATE ('1993-04-30','YYYY-MM-DD'),'60322','Andy McBrine','bowler','29');
INSERT INTO players VALUES(486,TO_DATE ('1987-07-08','YYYY-MM-DD'),'53755','Shapoor Zadran','bowler','40');
INSERT INTO players VALUES(489,TO_DATE ('1982-06-06','YYYY-MM-DD'),'61264','Mohammad Irfan','bowler','7');
INSERT INTO players VALUES(492,TO_DATE ('1982-07-30','YYYY-MM-DD'),'10829','James Anderson','bowler','1');
INSERT INTO players VALUES(493,TO_DATE ('1982-05-16','YYYY-MM-DD'),'48087','Nikita Miller','bowler','4');
INSERT INTO players VALUES(496,TO_DATE ('1995-04-03','YYYY-MM-DD'),'66808','Taskin Ahmed','bowler','25');
INSERT INTO players VALUES(510,TO_DATE ('1982-11-22','YYYY-MM-DD'),'12912','Xavier Doherty','bowler','2');
INSERT INTO players VALUES(513,TO_DATE ('1989-01-12','YYYY-MM-DD'),'59616','Alasdair Evans','bowler','30');
INSERT INTO players VALUES(515,TO_DATE ('1986-06-11','YYYY-MM-DD'),'53716','Mitchell McClenaghan','bowler','5');
INSERT INTO players VALUES(518,TO_DATE ('1993-05-08','YYYY-MM-DD'),'64244','Pat Cummins','bowler','2');
INSERT INTO players VALUES(519,TO_DATE ('1981-02-14','YYYY-MM-DD'),'12206','Manjula Guruge','bowler','27');
INSERT INTO players VALUES(528,TO_DATE ('1989-08-09','YYYY-MM-DD'),'52405','Lahiru Thirimanne','top-order batsman','8');
INSERT INTO players VALUES(530,TO_DATE ('1986-09-06','YYYY-MM-DD'),'47619','Chamu Chibhabha','top-order batsman','9');
INSERT INTO players VALUES(535,TO_DATE ('1986-04-24','YYYY-MM-DD'),'52319','Sikandar Raza','batting allrounder','9');
INSERT INTO players VALUES(564,TO_DATE ('1989-01-03','YYYY-MM-DD'),'49532','Alex Hales','opening batsman','1');
INSERT INTO players VALUES(569,TO_DATE ('1990-08-17','YYYY-MM-DD'),'52373','Kusal Perera','wicketkeeper batsman','8');
INSERT INTO players VALUES(576,TO_DATE ('1976-10-14','YYYY-MM-DD'),'7419','Tillakaratne Dilshan','allrounder','8');
INSERT INTO players VALUES(583,TO_DATE ('1987-09-20','YYYY-MM-DD'),'51554','Regis Chakabva','wicketkeeper batsman','9');
INSERT INTO players VALUES(600,TO_DATE ('1996-11-20','YYYY-MM-DD'),'74913','Usman Ghani','opening batsman','40');
INSERT INTO players VALUES(613,TO_DATE ('1983-08-09','YYYY-MM-DD'),'10423','Hamilton Masakadza','top-order batsman','9');
INSERT INTO players VALUES(615,TO_DATE ('1989-01-14','YYYY-MM-DD'),'55194','Johnson Charles','wicketkeeper batsman','4');
INSERT INTO players VALUES(624,TO_DATE ('1977-10-27','YYYY-MM-DD'),'9587','Kumar Sangakkara','wicketkeeper batsman','8');
INSERT INTO players VALUES(628,TO_DATE ('1989-02-06','YYYY-MM-DD'),'51054','Darren Bravo','top-order batsman','4');
INSERT INTO players VALUES(629,TO_DATE ('1991-01-04','YYYY-MM-DD'),'71239','Hamish Gardiner','opening batsman','30');
INSERT INTO players VALUES(652,TO_DATE ('1989-08-21','YYYY-MM-DD'),'51444','Solomon Mire','batsman','9');
INSERT INTO players VALUES(672,TO_DATE ('1977-05-27','YYYY-MM-DD'),'6315','Mahela Jayawardene','batsman','8');
INSERT INTO players VALUES(674,TO_DATE ('1986-02-06','YYYY-MM-DD'),'45253','Brendan Taylor','wicketkeeper batsman','9');
INSERT INTO players VALUES(682,TO_DATE ('1988-04-21','YYYY-MM-DD'),'48988','Dimuth Karunaratne','opening batsman','8');
INSERT INTO players VALUES(722,TO_DATE ('1986-09-26','YYYY-MM-DD'),'47206','Sean Williams','middle-order batsman','9');
INSERT INTO players VALUES(740,TO_DATE ('1987-06-02','YYYY-MM-DD'),'47023','Angelo Mathews','allrounder','8');
INSERT INTO players VALUES(770,TO_DATE ('1985-08-19','YYYY-MM-DD'),'47205','Craig Ervine','middle-order batsman','9');
INSERT INTO players VALUES(798,TO_DATE ('1989-11-18','YYYY-MM-DD'),'52371','Dinesh Chandimal','wicketkeeper batsman','8');
INSERT INTO players VALUES(802,TO_DATE ('1987-08-10','YYYY-MM-DD'),'78011','Saqlain Haider','middle-order batsman','27');
INSERT INTO players VALUES(816,TO_DATE ('1983-01-15','YYYY-MM-DD'),'24777','Jeevan Mendis','allrounder','8');
INSERT INTO players VALUES(818,TO_DATE ('1986-03-14','YYYY-MM-DD'),'45252','Elton Chigumbura','allrounder','9');
INSERT INTO players VALUES(827,TO_DATE ('1989-07-30','YYYY-MM-DD'),'50121','Wayne Parnell','bowler','3');
INSERT INTO players VALUES(829,TO_DATE ('1983-05-03','YYYY-MM-DD'),'10639','Stuart Matsikenyeri',NULL,'9');
INSERT INTO players VALUES(846,TO_DATE ('1989-04-03','YYYY-MM-DD'),'49193','Thisara Perera','allrounder','8');
INSERT INTO players VALUES(852,TO_DATE ('1985-05-04','YYYY-MM-DD'),'44691','Ravi Bopara','middle-order batsman','1');
INSERT INTO players VALUES(864,TO_DATE ('1982-07-22','YYYY-MM-DD'),'46206','Nuwan Kulasekara','bowler','8');
INSERT INTO players VALUES(894,TO_DATE ('1985-02-02','YYYY-MM-DD'),'11334','Upul Tharanga','batsman','8');
INSERT INTO players VALUES(897,TO_DATE ('1985-06-27','YYYY-MM-DD'),'50378','Seekkuge Prasanna','allrounder','8');
INSERT INTO players VALUES(900,TO_DATE ('1988-10-04','YYYY-MM-DD'),'51421','Chris Jordan','bowler','1');
INSERT INTO players VALUES(912,TO_DATE ('1978-03-19','YYYY-MM-DD'),'8460','Rangana Herath','bowler','8');
INSERT INTO players VALUES(914,TO_DATE ('1985-10-21','YYYY-MM-DD'),'47209','Tinashe Panyangara','bowler','9');
INSERT INTO players VALUES(915,TO_DATE ('1986-05-02','YYYY-MM-DD'),'45170','Yasir Shah','bowler','7');
INSERT INTO players VALUES(924,TO_DATE ('1983-02-11','YYYY-MM-DD'),'46091','Majid Haq','bowler','30');
INSERT INTO players VALUES(933,TO_DATE ('1985-04-16','YYYY-MM-DD'),'45215','Tawanda Mupariwa','bowler','9');
INSERT INTO players VALUES(948,TO_DATE ('1982-02-27','YYYY-MM-DD'),'10831','James Tredwell','allrounder','1');
INSERT INTO players VALUES(953,TO_DATE ('1993-03-05','YYYY-MM-DD'),'62763','Tharindu Kaushal','bowler','8');
INSERT INTO players VALUES(955,TO_DATE ('1993-03-15','YYYY-MM-DD'),'67169','Ehsan Adil','bowler','7');
INSERT INTO players VALUES(960,TO_DATE ('1983-08-28','YYYY-MM-DD'),'45105','Lasith Malinga','bowler','8');
INSERT INTO players VALUES(962,TO_DATE ('1991-02-28','YYYY-MM-DD'),'60782','Tendai Chatara','bowler','9');
INSERT INTO players VALUES(964,TO_DATE ('1988-06-30','YYYY-MM-DD'),'49034','Kemar Roach','bowler','4');
INSERT INTO players VALUES(990,TO_DATE ('1985-02-09','YYYY-MM-DD'),'50837','Sachithra Senanayake','bowler','8');
INSERT INTO players VALUES(994,TO_DATE ('1980-08-25','YYYY-MM-DD'),'70560','Kamran Shazad','bowler','27');
INSERT INTO players VALUES(995,TO_DATE ('1992-02-07','YYYY-MM-DD'),'59679','Taijul Islam','bowler','25');
INSERT INTO players VALUES(1001,TO_DATE ('1992-01-11','YYYY-MM-DD'),'67342','Dushmantha Chameera','bowler','8');
INSERT INTO players VALUES(1008,TO_DATE ('1987-03-10','YYYY-MM-DD'),'46995','Suranga Lakmal','bowler','8');
INSERT INTO players VALUES(1010,TO_DATE ('1987-06-08','YYYY-MM-DD'),'49272','Tafadzwa Kamungozi','allrounder','9');
INSERT INTO players VALUES(1013,TO_DATE ('1985-06-29','YYYY-MM-DD'),'64991','Iain Wardlaw','bowler','30');
INSERT INTO players VALUES(1017,TO_DATE ('1981-07-22','YYYY-MM-DD'),'10506','Sulieman Benn','bowler','4');
INSERT INTO players VALUES(1042,TO_DATE ('1982-07-31','YYYY-MM-DD'),'48749','Fahad Alhashmi','bowler','27');

