# 2015cwc

An Oracle database consisting of matches, teams, players, officials, and grounds from the 2015 Cricket World Cup. Data were collected from ESPNcricinfo with the help of [python-espncricinfo](https://github.com/dwillis/python-espncricinfo) and then reformatted for [Oracle Live SQL](https://livesql.oracle.com). Created Fall 2016 for data warehousing class project at Tarleton State University.

### Files
- `erd.png`: Database entity relationship diagram
- `db_setup.sql`: SQL code for creating database (works perfectly in Oracle Live SQL)
- `queries.sql`: Sample queries that run in the database (again, especially for Oracle Live SQL)
- `espnbeamer.pdf`: Class presentation
- `cricket_database.py`: Python code for collecting 2015 world cup data from ESPNcricinfo
