class python_pod () {
kubernetes_pod { 'python-pod':
  ensure   => present,
  metadata => {
  'name' => 'python-pod',
  'namespace' => 'default',
  'labels' => {
    'app' => 'python'
  }
},
  spec     => {
  'volumes' => [
    {
      'name' => 'conf-data',
      'emptyDir' => {

      }
    },
    {
      'name' => 'ssl-certs',
      'emptyDir' => {

      }
    },
  ],
  'containers' => [
    {
      'name' => 'proxy',
      'image' => 'nginx-proxy:4',
      'ports' => [
        {
          'containerPort' => 443,
          'protocol' => 'TCP'
        }],
      'resources' => { },
      'volumeMounts' => [
        {
          'name' => 'ssl-certs',
          'mountPath' => '/etc/nginx/certs'
        },
      ],
    },
    {
      'name' => 'python-service',
      'image' => 'web:2',
      'ports' => [
        {
          'containerPort' => 80,
          'protocol' => 'TCP'
        }],
      'resources' => { },
      'volumeMounts' => [
        {
          'name' => 'conf-data',
          'mountPath' => '/app/conf'
        },
      ],
    },
    {
      'name' => 'puppet',
      'image' => 'puppet/puppet-agent',
      'command' => ['/opt/puppetlabs/bin/puppet'],
      'args' => ['agent', '--verbose', '--no-daemonize', '--summarize'],
      'resources' => { },
      'volumeMounts' => [
        {
          'name' => 'conf-data',
          'mountPath' => '/conf-data'
        },
        {
          'name' => 'ssl-certs',
          'mountPath' => '/ssl-certs'
        },
      ],
    }],
  },
}
}
