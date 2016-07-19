#!/bin/bash

./release.sh
./rmipcs.sh

./approach root@localhost:3306 FO4S
