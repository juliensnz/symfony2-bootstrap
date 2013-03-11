#!/bin/bash

if [ "$1" == "" ]; then
    phpunit -c app  --process-isolation
else
    phpunit -c app --filter $1  --process-isolation
fi

./tools/notifier.py "Tests" "DONE"
