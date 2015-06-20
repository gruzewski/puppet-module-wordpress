class wordpress::db {

  class { '::mysql::client': }

  class { '::mysql::server':
    root_password           => $wordpress::conf::root_password,
    remove_default_accounts => true,

    # Create the database
    databases => {
       "${wordpress::conf::db_name}" => {
           ensure => 'present',
           charset => 'utf8'
        }
    },

    # Create the user
    users => {
       "${wordpress::conf::db_user_host}" => {
           ensure => present,
           password_hash => mysql_password("${wordpress::conf::db_user_password}")
        }
    },

    # Grant privileges to the user
    grants => {
       "${wordpress::conf::db_user_host_db}" => {
            ensure     => 'present',
            options    => ['GRANT'],
            privileges => ['ALL'],
            table      => "${wordpress::conf::db_name}.*",
            user       => "${wordpress::conf::db_user_host}",
        }
    },
  }


#  mysql::db { '$wordpress:comf::dn_name':
#    user     => 'wordpress',
#    password => 'password',
#    host     => 'localhost',
#    grant    => ['ALL'],
#  }
}
