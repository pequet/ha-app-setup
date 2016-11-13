#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

    ee site create $site --php7

    if [[ $this_privateip == "" ]]; then this_privateip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'); fi
    echo -e '<!DOCTYPE html><html><head><title>Welcome to '$site'!</title></head><body><p>Welcome to <?php print "<b>"; ?>'$site'<?php print "</b>"; ?>! ('$(echo $this_privateip | cut -d . -f 4)')</p></body></html>' > /var/www/$site/htdocs/index.php
    
# ----------------------------------------------------------------------

# end
