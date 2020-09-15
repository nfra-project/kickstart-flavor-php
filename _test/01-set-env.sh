#!/bin/bash

##
# Load the environment from kick.yml and evaluate it
# So you can also extend like PATH or modify environment
# directly
#


envtoset=`kick kick_to_env`
debug "kick_to_env raw: $envtoset"
## Evaluate and replace $PATH in envtoset

export $envtoset;

for curEnv in $envtoset;
do
    echo "round one: $curEnv"

    export "$curEnv"
done


## Multiline needs to be evaled



