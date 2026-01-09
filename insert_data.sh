#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear existing data
echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY CASCADE")

# Read games.csv (tr -d '\r' removes Windows line endings which cause lookup errors)
cat games.csv | tr -d '\r' | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip header row
  if [[ $YEAR != "year" ]]
  then
    # ----------------------------------------------------
    # 1. HANDLE WINNER TEAM
    # ----------------------------------------------------
    # Get winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # If not found, insert team
    if [[ -z $WINNER_ID ]]
    then
      $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      # Get new winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # ----------------------------------------------------
    # 2. HANDLE OPPONENT TEAM
    # ----------------------------------------------------
    # Get opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # If not found, insert team
    if [[ -z $OPPONENT_ID ]]
    then
      $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      # Get new opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # ----------------------------------------------------
    # 3. INSERT GAME
    # ----------------------------------------------------
    # Insert using IDs, NOT names.
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted game: $YEAR $ROUND - $WINNER vs $OPPONENT"
    fi
  fi
done