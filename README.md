## Puppet module to install Wordpress ##

This is very simple Puppet module to install Wordpress. It will install Apache2, MySQL, PHP, and finally Wordpress.

### Requirements ###
 - Puppet
 - Puppetlabs-Apache module
 - Puppetlabs-Mysql module

### Installation ###
```
apt-get update -y && apt-get upgrade -y
apt-get install -y puppet
apt-get install -y git
puppet module install puppetlabs-apache
puppet module install puppetlabs-mysql
cd /tmp/ && git clone https://github.com/gruzewski/puppet-module-wordpress.git
cp -R /tmp/puppet-module-wordpress /etc/puppet/modules/wordpress
echo "class { 'wordpress': }" >> /etc/puppet/manifests/wp.pp
puppet apply /etc/puppet/manifests/wp.pp
```
