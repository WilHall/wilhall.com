## Overview

Hyperlocal art and events

## Local Development

On Ubuntu

1. `git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0`
1. `echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc`
1. `source ~/.bashrc`
1. `sudo apt-get install libpq-dev`
1. `asdf plugin add nodejs`
1. `asdf plugin add ruby`
1. `asdf plugin add yarn`
1. `asdf install`
1. `rails db:create db:migrate`
1. `bin/dev`

## Hosting Setup

Ubuntu 24.04 install dependencies as root

1. `sudo apt-get install locate postgresql nginx build-essential checkinstall libvips zlib1g-dev libssl-dev libffi-dev libtool libyaml-dev libcurl4-openssl-dev libpq-dev dirmngr gnupg npm dirmngr gnupg apt-transport-https ca-certificates curl gnupg apt-transport-https redis-server`
1. Follow https://www.phusionpassenger.com/docs/advanced_guides/install_and_upgrade/nginx/install/oss/noble.html
1. Follow https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-22-04
1. `sudo apt-get remove nodejs libnode-dev`
1. `curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -`
1. `sudo apt-get install -y nodejs`
1. `npm install --global yarn`
1. `curl -sSL https://get.rvm.io | bash -s stable --ruby`
1. `echo 'source /usr/local/rvm/scripts/rvm' >> ~/.bashrc`
1. `exec bash`
1. `rvm install "ruby-3.3.4"`
1. `sudo snap install --classic certbot`
1. `sudo ln -s /snap/bin/certbot /usr/bin/certbot`
1. `sudo certbot --nginx`
1. `sudo -u postgres -s`
1. `psql`
1. `CREATE DATABASE wilhall_production`
1. `CREATE USER wilhall PASSWORD '...';`
1. `GRANT ALL PRIVILEGES ON DATABASE wilhall_production TO wilhall;`
1. `exit`
1. `exit`
1. `cp sidekiq.service /etc/systemd/system`
1. `sudo systemctl daemon-reload`
1. `sudo systemctl enable sidekiq`
1. `sudo systemctl start sidekiq`

```
server {
   listen 80;
   server_name wilhall.com;
   passenger_enabled on;
   passenger_app_env production;
   passenger_app_root /var/www/wilhall.com;
   root /var/www/wilhall.com/public;
}
```

For debugging:
`sudo less /var/log/nginx/error.log`

# Deployment

1. `git pull`
1. `bin/deploy`