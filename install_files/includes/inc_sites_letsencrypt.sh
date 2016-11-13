#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

    rsync -a $dir/myfiles/etc/letsencrypt/archive/$site /etc/letsencrypt/archive
    rsync -a $dir/myfiles/etc/letsencrypt/renewal/$site /etc/letsencrypt/renewal

    mkdir -p /etc/letsencrypt/live/$site
    ln -s /etc/letsencrypt/archive/$site/cert1.pem /etc/letsencrypt/live/$site/cert.pem
    ln -s /etc/letsencrypt/archive/$site/chain1.pem /etc/letsencrypt/live/$site/chain.pem
    ln -s /etc/letsencrypt/archive/$site/fullchain1.pem /etc/letsencrypt/live/$site/fullchain.pem
    ln -s /etc/letsencrypt/archive/$site/privkey1.pem /etc/letsencrypt/live/$site/privkey.pem

    ee site update $site --letsencrypt

# ----------------------------------------------------------------------

# end
