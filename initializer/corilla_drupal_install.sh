#!/bin/bash

scriptPath=$( dirname $(realpath "$0") )
htmlPath="/root/pippo"

cd $scriptPath

# Includo gli script.
source include/_vars.sh
source include/sysvars.sh
source include/composer.sh
source include/git.sh
source include/database.sh
source include/install.sh
#source include/corillatheme.sh
#source include/childtheme.sh
source include/themes.sh
source include/update.sh
source include/cleanup.sh