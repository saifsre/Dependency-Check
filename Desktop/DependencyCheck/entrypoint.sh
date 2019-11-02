#!/bin/sh

echo Preparing to run Dependency Check

/home/dependency-check/bin/dependency-check.sh "CC App" --scan "/home/repo" --out "/home/report"


