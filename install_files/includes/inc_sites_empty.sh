#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

    ee site create $site --php7
    echo -e '<!DOCTYPE html><html><head><title>Welcome to '$site'!</title></head><body><p>Welcome to <?php print "<b>"; ?>'$site'<?php print "</b>"; ?>! ('$(echo $this_privateip | cut -d . -f 4)')</p></body></html>' > /var/www/$site/htdocs/index.php
    
# ----------------------------------------------------------------------

# end
