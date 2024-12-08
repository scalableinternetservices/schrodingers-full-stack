#!/bin/bash

# Define the array
DIRS=("poster" "event_manager" "rsvp" "signup" "social")

# Loop through the array and run the tsplot command
for GRAPH_DIR in "${DIRS[@]}"; do
    # Define the paths for DIR1 and DIR2
    DIR1_OPTIMIZATION="Pagination"
    DIR1="./pagination/tsung_$GRAPH_DIR/tsung.log"
    echo $DIR1

    DIR2_OPTIMIZATION="Pagination+Indexing+Caching"
    DIR2="./all_but_one/tsung_$GRAPH_DIR/tsung.log"
    echo $DIR2
    # Run the tsplot command with the current GRAPH_DIR
    python2 /usr/bin/tsplot -d "graphs/all_but_one/$GRAPH_DIR" $DIR1_OPTIMIZATION $DIR1 $DIR2_OPTIMIZATION $DIR2
done
