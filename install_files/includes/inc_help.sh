#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

    cat << EOF
Usage:

 ./install

Add a single site to your setup:

 ./install site add domain.name [wpmu|wp] [letsencrypt]

   wpmu         wordpress multisite
   wp           wordpress site
   letsencrypt  adds a new certificate
                or imports an existing certificate from ./myfiles/etc/letsencrypt/archive
                                                    and ./myfiles/etc/letsencrypt/renewal

Run a quick check:

 ./install check

Update:

 ./install update

EOF

# ----------------------------------------------------------------------

# end
