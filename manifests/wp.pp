class wordpress::wp {

    # Copy the Wordpress bundle to /tmp
    file { '/tmp/latest.tar.gz':
        ensure => present,
        source => "puppet:///modules/wordpress/latest.tar.gz"
    }

    # Extract the Wordpress bundle
    exec { 'extract':
        cwd => "/tmp",
        command => "tar -xvzf latest.tar.gz",
        require => File['/tmp/latest.tar.gz'],
        path => ['/bin'],
    }

    # Copy to /var/www/wordpress
    exec { 'copy':
        command => "cp -r /tmp/wordpress/* /var/www/wordpress",
        require => Exec['extract'],
        path => ['/bin'],
    }

    # Generate the wp-config.php file using the template
    file { '/var/www/wordpress/wp-config.php':
        ensure => present,
        require => Exec['copy'],
        content => template("wordpress/wp-config.php.erb")
    }
}
