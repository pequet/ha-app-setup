#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

    ee site create $site --wpsubdomain --php7

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
    cp $dir_install/etc/nginx/sites-available/subdomains /etc/nginx/sites-available/$site$subdomains_conf_suffix
    chmod 644 /etc/nginx/sites-available/$site$subdomains_conf_suffix
    sed -i -e 's|\[SITE_DOMAIN\]|'$site'|g' /etc/nginx/sites-available/$site$subdomains_conf_suffix
    ln -s /etc/nginx/sites-available/$site$subdomains_conf_suffix /etc/nginx/sites-enabled/$site$subdomains_conf_suffix

    # replace *. with www. in original conf
    sed -i -e 's|*.'$site'|www.'$site'|g' /etc/nginx/sites-available/$site

# ----------------------------------------------------------------------

# end
