#!/bin/bash

phpunit $@

./tools/notifier.py "Tests $@" "DONE"
