package { 'kubectl':
    ensure => 'installed',
    provider => 'brew',
}

package { 'docker-machine-driver-xhyve':
    ensure => 'installed',
    provider => 'brew',
}

exec { 'Install minikube':
    command => 'curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.0/minikube-darwin-amd64',
    cwd => '/usr/local/bin',
    creates => '/usr/local/bin/minikube',
    path    => ['/usr/bin'],
}

file { 'Make minikube executable':
    path => '/usr/local/bin/minikube',
    mode => 'ug=x', 
}

exec { 'Start minikube':
    command => 'minikube start',
    path    => ['/usr/local/bin', '/usr/bin'],
    unless  => 'minikube status | grep "minikube: Running"'
}

