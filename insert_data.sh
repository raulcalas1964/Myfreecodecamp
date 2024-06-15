#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
clear
TRUNCATETABLES=$($PSQL "TRUNCATE TABLE teams,games");
cat games.csv | while  IFS="," read  LYEAR LROUND LWINNER LOPPONENT LWG LOG;
do
if [[ $LYEAR -ne year ]]
then 
#  echo $LYEAR  $LROUND  $LWINNER  $LOPPONENT  $LWG  $LWO
TEAM=$($PSQL "SELECT name FROM teams WHERE name = '$LWINNER'");
#echo $LWINNER
if [ -z $TEAM ] 
 then
INSERT_INTO_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$LWINNER')");
#if [$INSERT_INTO_TEAM 0 1 ] 
# then
#  echo 'Insertado en teams el pais' $LWINNER
# fi
 fi
TEAM=$($PSQL "SELECT name FROM teams WHERE name = '$LOPPONENT'");
#echo $LWINNER
if [ -z $TEAM ] 
 then
INSERT_INTO_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$LOPPONENT')");
#if [$INSERT_INTO_TEAM 0 1 ] 
# then
#  echo 'Insertado en teams el pais' $LOPPONENT
# fi

 fi
 WINNERID=$($PSQL "SELECT team_id FROM teams WHERE name = '$LWINNER'");
 OPPONENTID=$($PSQL "SELECT team_id FROM teams WHERE name = '$LOPPONENT'");
 echo $WINNERID $OPPONENTID
 echo "INSERT INTO games(winner_id,opponent_id,year,round,winner_goals,opponent_goals) VALUES($WINNERID,$OPPONENTID,$LYEAR,'$LROUND',$LWG,$LOG)"
 INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(winner_id,opponent_id,year,round,winner_goals,opponent_goals) VALUES($WINNERID,$OPPONENTID,$LYEAR,'$LROUND',$LWG,$LOG)");
#if [$INSERT_INTO_GAMES 0 1 ] 
# then
#  echo 'Insertado en games la ronda' $LROUND
# fi
fi 
done


#Salvando la base de datos
#pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql 
