#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

    ee site create $site --wp --php7

    # collectivise the means of production
    for folder in themes plugins
    do
        if [[ ! -d /var/www/SHARED/wordpress.live/wp-content/$folder ]];
        then
            mkdir -p /var/www/SHARED/wordpress.live/wp-content/$folder
            mv /var/www/$site/htdocs/wp-content/$folder/* /var/www/SHARED/wordpress.live/wp-content/$folder
            sleep 1
        fi
    done

    rm -Rf /var/www/$site/htdocs/wp-content/themes
    rm -Rf /var/www/$site/htdocs/wp-content/plugins
    ln -s /var/www/SHARED/wordpress.live/wp-content/themes /var/www/$site/htdocs/wp-content/themes
    ln -s /var/www/SHARED/wordpress.live/wp-content/plugins /var/www/$site/htdocs/wp-content/plugins

# ----------------------------------------------------------------------

# end
