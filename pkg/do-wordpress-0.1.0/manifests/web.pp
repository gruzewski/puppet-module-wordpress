class wordpress::web {

  class { 'apache': 
    mpm_module => 'prefork'
  }

  apache::vhost { 'wordpress':
    port     => '80',
    docroot  => '/var/www/wordpress',
    priority => '20',
  }

  include apache::mod::php

}
