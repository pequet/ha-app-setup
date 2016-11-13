#!/bin/bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# rename config-sample.sh to config.sh

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

config_floating_ip=""

config_server1_private_ip="" ### it doesn't matter which is MASTER and STANDBY
config_server2_private_ip="" ### it doesn't matter which is MASTER and STANDBY

config_wpmultisites_sites_arr=(site1.tld site2.tld) ### wp multisites
config_wp_sites_arr=(site5.tld site6.tld) ### wp sites
config_empty_sites_arr=(site3.tld site4.tld) ### perhaps just mapped domains or subdomain names that need a ssl certificate
config_ssl_sites_arr=(site1.tld site2.tld site3.tld) ### domain names from above that have a ssl certificate
config_db_names="site_01 site_02 site_03 site_04" ### databases to set up mysqldump for

config_mysqldump_user="mysqldump"
config_mysqldump_password=""
config_mysql_host=""

# ssh users
config_ftp_user="ftpuser" ### name of your first user
config_rsync_user="rsyncuser"

#keepalived
config_install_keepalived=1
config_keepalived_version="1.2.24" ### see http://www.keepalived.org/download.html for the latest version
config_keepalived_password="" ### only the first 8 characters matter
config_digitalocean_api_token=""

# php trader
config_install_trader=1 ### 0 or 1
config_php_version="7.0"

# fail2ban
config_install_fail2ban=1
config_fail2ban_your_homeip="" ### for whitelisting (you can leave blank)
config_fail2ban_destemail="you@gmail.com"
config_fail2ban_senderemail="you+fail2ban@gmail.com"
config_fail2ban_sendername="Fail2ban"

# clamscan
config_install_clamscan=1
config_clamscan_sendername="Clamscan" ### for the infection notifications
config_clamscan_senderemail="you@gmail.com"
config_clamscan_destemail="you+clamscan@gmail.com"

# chkrootkit
config_install_chkrootkit=1

# newrelic
config_install_newrelic=1
config_newrelic_license=""
config_nginx_status_url="https://domain.tld/status"
config_auth_user="" ### leave blank for none
config_auth_password="" ### leave blank for none

# iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii

# index of locations for each variable

# iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii

# config_auth_password           /etc/nginx-nr-agent/nginx-nr-agent.ini
# config_auth_user               /etc/nginx-nr-agent/nginx-nr-agent.ini
# config_clamscan_destemail      /etc/cron.daily/config_clamscan_daily
# config_clamscan_senderemail    /etc/cron.daily/config_clamscan_daily
# config_clamscan_sendername     /etc/cron.daily/config_clamscan_daily
# config_db_names                /etc/cron.daily/mysqldump_daily
#                                /etc/cron.hourly/mysqldump_hourly
# config_digitalocean_api_token  /etc/keepalived/master.sh
# config_fail2ban_destemail      /etc/fail2ban/jail.local
# config_fail2ban_senderemail    /etc/fail2ban/jail.local
# config_fail2ban_sendername     /etc/fail2ban/jail.local
# config_fail2ban_your_homeip    /etc/fail2ban/jail.local
# config_floating_ip             /etc/keepalived/master.sh
# config_keepalived_password     /etc/keepalived/keepalived.conf
# config_mysql_host              /etc/cron.daily/mysqldump_daily
#                                /etc/cron.hourly/mysqldump_hourly
# config_mysqldump_password      /etc/cron.daily/mysqldump_daily
#                                /etc/cron.hourly/mysqldump_hourly
# config_mysqldump_user          /etc/cron.daily/mysqldump_daily
#                                /etc/cron.hourly/mysqldump_hourly
# config_newrelic_license        /etc/nginx-nr-agent/nginx-nr-agent.ini
#                                /etc/php/7.0/fpm/conf.d/20-newrelic.ini
#                                /etc/php/7.0/CLI/conf.d/20-newrelic.ini
#                                /etc/newrelic/nrsysmond.cfg
# config_nginx_status_url        /etc/nginx-nr-agent/nginx-nr-agent.ini
# config_server1_private_ip      /etc/keepalived/keepalived.conf
# config_server2_private_ip      /etc/keepalived/keepalived.conf

# ----------------------------------------------------------------------

# end
