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

    # rm -Rf /var/www/$site/htdocs/wp-content/themes
    # rm -Rf /var/www/$site/htdocs/wp-content/plugins
    # ln -s /var/www/SHARED/wordpress.live/wp-content/themes /var/www/$site/htdocs/wp-content/themes
    # ln -s /var/www/SHARED/wordpress.live/wp-content/plugins /var/www/$site/htdocs/wp-content/plugins
    echo "# $site" >> /etc/fstab
    echo "bindfs#/var/www/SHARED/wordpress.live/wp-content/plugins /var/www/$site/htdocs/wp-content/plugins fuse force-user=$user,force-group=$user,create-for-user=www-data,create-for-group=www-data,create-with-perms=0770,chgrp-ignore,chown-ignore,chmod-ignore 0 0" >> /etc/fstab
    echo "bindfs#/var/www/SHARED/wordpress.live/wp-content/themes /var/www/$site/htdocs/wp-content/themes fuse force-user=$user,force-group=$user,create-for-user=www-data,create-for-group=www-data,create-with-perms=0770,chgrp-ignore,chown-ignore,chmod-ignore 0 0" >> /etc/fstab
    mount /var/www/$site/htdocs/wp-content/plugins
    mount /var/www/$site/htdocs/wp-content/themes
    find /var/www/$site/htdocs/wp-content -type d -exec chmod 775 {} \;
    find /var/www/$site/htdocs/wp-content -type f -exec chmod 664 {} \;

    cp $dir_install/etc/nginx/sites-available/subdomains /etc/nginx/sites-available/$site$subdomains_conf_suffix
    chmod 644 /etc/nginx/sites-available/$site$subdomains_conf_suffix
    sed -i -e 's|\[SITE_DOMAIN\]|'$site'|g' /etc/nginx/sites-available/$site$subdomains_conf_suffix
    ln -s /etc/nginx/sites-available/$site$subdomains_conf_suffix /etc/nginx/sites-enabled/$site$subdomains_conf_suffix

    # replace *. with www. in original conf
    sed -i -e 's|*.'$site'|www.'$site'|g' /etc/nginx/sites-available/$site

# ----------------------------------------------------------------------

# end
