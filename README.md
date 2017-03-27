This is a generic installation script quickly put together to provision new servers for an extensible but very capable High Availability setup, for multiple sites (PHP, WordPress including Multisites). 

Automation speeds up deployment and recovery from critical events.

This presupposes two fresh Ubuntu 16.04 droplets on DigitalOcean with Private Networking and a private IP.

- Besides installing the necessary packages, creating user accounts, the script uses EasyEngine to create all configuration files for your sites, manage new or existing SSL certificates (Let's Encrypt). 

- The High Availability provided by Keepalived and the DO floating IP and API will work "out of the box". When a site becomes unavailable for any reason, the standby server takes over within usually one or two seconds.

- SSH root access is disabled. Backups and database dumps are set up with hourly, daily and weekly rotation automatically, and clamscan, chkrootkit, and fail2ban (with a custom jail to make the bans permanent) can be installed optionally. See the install and config files. 

**The script and accompanying config file to run are identical for installing both MASTER and STANDBY server.** 

And here comes the best part, we're giving it to you absolutely free. 

##Steps

###Add your new server public key to your github account

```
ssh-keygen
cat /root/.ssh/id_rsa.pub
```

###Grab the installer and edit the config file (or use your own)

```
git clone git@github.com:pequet/ha-app-setup.git
cd ha-app-setup
cp config-sample.sh config.sh
chmod +x install
```

Place your Let's Encrypt certificates in the ./myfiles/etc/letsencrypt/archives and /renew folders (only these two) so they can be added to the sites and activated by the installer.

###Install

```
./install 
```

If you need to add another site later the syntax is:

```
./install [site add <domain.name>] [wpmu|wp] [letsecrypt]
```

That's it. 

☺︎

Added: 

```
./install check
./install update
./install help
```

Added: 

- the OpenDNS I.P. addresses to the Network Interface
- ask ftp_user if they want to su root upon log in 
