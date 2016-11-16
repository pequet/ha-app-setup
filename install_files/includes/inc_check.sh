#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

# build an array with services
declare -a installed_arr
let counter=-1

ee -v
ee stack status

echo "-"; title "bindfs"; bindfs -V
echo "-"; title "bc"; bc -v
echo "-"; title "screen"; screen -v
echo "-"; title "mailutils"; mailutils -V

if [[ $config_install_trader==1 ]]
then
    echo "-"; title "php trader"
    pecl info trader;
fi

installed_arr=("${installed_arr[@]}" "nginx");

if [[ $config_install_keepalived==1 ]]; then installed_arr=("${installed_arr[@]}" "keepalived"); fi

echo "-"; title "wp multisites"
for site in "${config_wpmultisites_sites_arr[@]}"
do
    if [[ -d /var/www/$site ]]
    then
        echo "$site exists"
    else
        echo "$site MISSING"
    fi
done

echo "-"; title "wp sites"
for site in "${config_wp_sites_arr[@]}"
do
    if [[ -d /var/www/$site ]]
    then
        echo "$site exists"
    else
        echo "$site MISSING"
    fi
done

echo "-"; title "sites"
for site in "${config_empty_sites_arr[@]}"
do
    if [[ -d /var/www/$site ]]
    then
        echo "$site exists"
    else
        echo "$site MISSING"
    fi
done

if [[ $config_install_fail2ban==1 ]]; then installed_arr=("${installed_arr[@]}" "fail2ban"); fi

if [[ config_install_chkrootkit==1 ]]
then 
    echo "-"; title "chkrootkit"
    chkrootkit -V; 
fi

if [[ config_install_clamscan==1 ]];
then
    installed_arr=("${installed_arr[@]}" "clamav-freshclam");
    installed_arr=("${installed_arr[@]}" "clamav-daemon");
fi

if [[ config_install_newrelic==1 ]];
then
    installed_arr=("${installed_arr[@]}" "newrelic-sysmond");
    installed_arr=("${installed_arr[@]}" "nginx-nr-agent");
fi

installed_arr=("${installed_arr[@]}" "cron");

for serv in ${installed_arr[@]}
do
    echo "-"; title "$serv"
    service $serv status
done

# ----------------------------------------------------------------------

# end
