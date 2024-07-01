#! /bin/bash

  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [ $# -eq 0 ]
 then
echo "Please provide an element as an argument."
else
# if input is a number
if [[  $1 =~ ^[0-9]+$ ]]
     then 
RESULT_AN=$($PSQL "SELECT e.atomic_number FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and e.atomic_number=$1");
RESULT_S=$($PSQL "SELECT e.symbol FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and e.atomic_number=$1");
RESULT_N=$($PSQL "SELECT e.name FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and e.atomic_number=$1");
RESULT_AM=$($PSQL "SELECT p.atomic_mass FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and e.atomic_number=$1");
RESULT_MP=$($PSQL "SELECT p.melting_point_celsius FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and e.atomic_number=$1");
RESULT_BP=$($PSQL "SELECT p.boiling_point_celsius FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and e.atomic_number=$1");
RESULT_T=$($PSQL "SELECT t.type FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and e.atomic_number=$1");
else
RESULT_AN=$($PSQL "SELECT e.atomic_number FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and (UPPER(e.symbol)=UPPER('$1') OR UPPER(e.name)=UPPER('$1'))");
RESULT_S=$($PSQL "SELECT e.symbol FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and (UPPER(e.symbol)=UPPER('$1') OR UPPER(e.name)=UPPER('$1'))");
RESULT_N=$($PSQL "SELECT e.name FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and (UPPER(e.symbol)=UPPER('$1') OR UPPER(e.name)=UPPER('$1'))");
RESULT_AM=$($PSQL "SELECT p.atomic_mass FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and (UPPER(e.symbol)=UPPER('$1') OR UPPER(e.name)=UPPER('$1'))");
RESULT_MP=$($PSQL "SELECT p.melting_point_celsius FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and (UPPER(e.symbol)=UPPER('$1') OR UPPER(e.name)=UPPER('$1'))");
RESULT_BP=$($PSQL "SELECT p.boiling_point_celsius FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and (UPPER(e.symbol)=UPPER('$1') OR UPPER(e.name)=UPPER('$1'))");
RESULT_T=$($PSQL "SELECT t.type FROM elements AS e, properties AS p, types AS t  WHERE e.atomic_number = p.atomic_number and p.type_id = t.type_id and (UPPER(e.symbol)=UPPER('$1') OR UPPER(e.name)=UPPER('$1'))");
fi
if [[ -z $RESULT_AN ]] 
then
 echo "I could not find that element in the database."
else 
echo "The element with atomic number $RESULT_AN is $RESULT_N ($RESULT_S). It's a $RESULT_T, with a mass of $RESULT_AM amu. $RESULT_N has a melting point of $RESULT_MP celsius and a boiling point of $RESULT_BP celsius."
fi
fi