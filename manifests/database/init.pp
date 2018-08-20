class database::database (String $db_host){
  file {'/conf-data/database':
    ensure  => 'file',
    content => $db_host,
  }
}