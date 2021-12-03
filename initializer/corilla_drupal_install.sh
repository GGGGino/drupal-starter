#!/bin/bash

# Here I get the path where the files are stored
scriptPath=$( dirname $(realpath "$0") )

# Here is the path
htmlPath=$(pwd)

cd $scriptPath

# Includo gli script.
source include/_vars.sh
source include/sysvars.sh
source include/composer.sh
source include/git.sh
source include/database.sh
source include/install.sh
# source include/corillatheme.sh
# source include/childtheme.sh
source include/themes.sh
source include/update.sh
# source include/cleanup.sh

# ciaool