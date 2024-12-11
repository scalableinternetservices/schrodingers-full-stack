#!/bin/bash

# Define the array
DIRS=("poster" "event_manager" "rsvp" "signup" "social")

# Loop through the array and run the tsplot command
for GRAPH_DIR in "${DIRS[@]}"; do
    # Define the paths for DIR1, DIR2, and DIR3
    DIR1_OPTIMIZATION="1_t3.micro"
    DIR1="./all_opt/tsung_$GRAPH_DIR/tsung.log"
    echo $DIR1

    DIR2_OPTIMIZATION="2_t3.micro"
    DIR2="./2t3micro/tsung_$GRAPH_DIR/tsung.log"
    echo $DIR2

    DIR3_OPTIMIZATION="4_t3.micro"
    DIR3="./4t3micro/tsung_$GRAPH_DIR/tsung.log"
    echo $DIR3

    # Run the tsplot command with the current GRAPH_DIR
    python2 /usr/bin/tsplot -v \
        -d "graphs/horizontal_scaling/$GRAPH_DIR" \
        $DIR1_OPTIMIZATION $DIR1 \
        $DIR2_OPTIMIZATION $DIR2 \
        $DIR3_OPTIMIZATION $DIR3
done
