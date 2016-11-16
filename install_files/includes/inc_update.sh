#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

apt-get update && apt-get upgrade -y

ee stack upgrade

apt-get autoremove -y && apt-get autoclean

# ----------------------------------------------------------------------

# end
