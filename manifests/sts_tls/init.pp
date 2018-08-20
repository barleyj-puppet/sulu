class sts_tls::sts_tls {
  openssl::certificate::x509 { 'service':
    base_dir     => '/ssl-certs',
    country      => 'CH',
    organization => 'Example.com',
    commonname   => $fqdn,
  }
}