#!/bin/bash

# Define the array
DIRS=("poster" "event_manager" "rsvp" "signup" "social")

# Loop through the array and run the tsplot command
for GRAPH_DIR in "${DIRS[@]}"; do
    # Define the paths for DIR1, DIR2, and DIR3
    DIR1_OPTIMIZATION="t3.micro"
    DIR1="./all_opt/tsung_$GRAPH_DIR/tsung.log"
    echo $DIR1

    DIR2_OPTIMIZATION="t3.medium"
    DIR2="./t3medium/tsung_$GRAPH_DIR/tsung.log"
    echo $DIR2

    DIR3_OPTIMIZATION="t3.large"
    DIR3="./t3large/tsung_$GRAPH_DIR/tsung.log"
    echo $DIR3

    # Run the tsplot command with the current GRAPH_DIR
    python2 /usr/bin/tsplot -v \
        -d "graphs/vertical_scaling/$GRAPH_DIR" \
        $DIR1_OPTIMIZATION $DIR1 \
        $DIR2_OPTIMIZATION $DIR2 \
        $DIR3_OPTIMIZATION $DIR3
done
