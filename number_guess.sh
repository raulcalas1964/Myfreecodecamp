#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
clear
echo "Enter your username:"
read USERNAME

  # get available bikes
  AVAILABLE_USER=$($PSQL "SELECT username FROM users WHERE UPPER(username)=UPPER('$USERNAME')")
 if [[ -z $AVAILABLE_USER ]]
  then 
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')") 
  USERID=$($PSQL "SELECT user_id FROM users AS s WHERE UPPER(username)=UPPER('$USERNAME')")
 else
  USERID=$($PSQL "SELECT user_id FROM users AS s WHERE UPPER(username)=UPPER('$AVAILABLE_USER')")
  GAMES_USER=$($PSQL "SELECT COUNT(*) FROM users AS s, games AS g  WHERE s.user_id=$USERID and s.user_id = g.user_id")
  BESTGAME=$($PSQL "SELECT MIN(numbertrying) FROM users AS s, games AS g  WHERE s.user_id=$USERID AND s.user_id = g.user_id")
  echo "Welcome back, $AVAILABLE_USER! You have played $GAMES_USER games, and your best game took $BESTGAME guesses."
 fi
 flag=0
 nt=0
 GUESSNUMBER=$((RANDOM % 1000 + 1))
  echo $GUESSNUMBER
  
 echo "Guess the secret number between 1 and 1000:"
 while [ 1 -eq 1 ]; do
   nt=$((nt+1))
   read USERNUMBER
   if [[ ! $USERNUMBER =~ ^[0-9]+$ ]] 
    then
    echo "That is not an integer, guess again:"
   else
   if [ $USERNUMBER -eq $GUESSNUMBER ] 
    then
   INSERT_USERGAME_RESULT=$($PSQL "INSERT INTO games(user_id,guessnumber,numbertrying) VALUES($USERID,$GUESSNUMBER,$nt)")     
    echo "You guessed it in $nt tries. The secret number was $GUESSNUMBER. Nice job!"
    exit
  else
  if [ $USERNUMBER -le $GUESSNUMBER ] 
  then
   echo "It's lower than that, guess again:"
  else
   echo "It's higher than that, guess again:"
  fi
  fi
  fi
  done
 