name "development"
description "Set up a development workstation for winnivote"

run_list("recipe[build-essential]",
         "recipe[winnivote]",
         "recipe[ruby_build]",
         "recipe[rbenv::system]",
        "recipe[mysql::server]",
        "recipe[mysql::client]",
        "recipe[winnivote::setup]")

ruby_version = '2.0.0-p247'
default_attributes( {
  'mysql' => {
    'server_root_password' => "vagrant",
    'server_debian_password' => "vagrant",
    'server_repl_password' => "vagrant"
  },
  'rbenv' => {
    'rubies' => [ ruby_version ],
    'global' => ruby_version,
    'gems' => {
      ruby_version => [
        { 'name' => 'bundler' },
        { 'name' => 'foreman' }
      ]
    }
  }
} )
