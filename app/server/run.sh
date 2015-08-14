#!/bin/sh

# Bin, Boss!
# A simple RESTful framework for Bash.
# Version 0.3.2

# FUNCTIONS
# ---------------------------------------------------------------------------------

for f in /boss/bin/*
do source $f
done

# COMMANDS
# ---------------------------------------------------------------------------------

  if [[  $1 == 'build'  ]];   then boss_build
elif [[  $1 == 'start'  ]];   then boss_start $@
elif [[  $1 == 'reload'  ]];  then boss_reload $@
elif [[  $1 == 'status'  ]];  then boss_status $@
elif [[  $1 == 'ps'  ]];      then boss_ps $@
elif [[  $1 == 'login'  ]];   then boss_login $@
elif [[  $1 == 'root'  ]];    then boss_root $@
elif [[  ! $0 == 'boss'  ]];  then /bin/bash -c "$@"

# HELP
# ---------------------------------------------------------------------------------

else boss_help
fi
