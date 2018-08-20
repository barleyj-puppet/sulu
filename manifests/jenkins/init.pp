class jenkins::jenkins {
  archive { '/tmp/all_plugins.tar.gz':
    ensure       => present,
    extract      => true,
    extract_path => '/conf-data',
    extract_flags => ' --strip-components 4 -xzf',
    source       => 'https://jenkins-enterprise.delivery.puppetlabs.net/job/admin_jenkins-timed-command_plugins-backup/460/artifact/all_plugins.tar.gz',
    creates      => '/conf-data/ldap.jpi',
    cleanup      => true,
  }

  openssl::certificate::x509 { 'jenkins':
    base_dir     => '/ssl-certs',
    country      => 'CH',
    organization => 'Example.com',
    commonname   => $fqdn,
  }
}
