require 'rubygems'
require 'safe_shell'

raise "Missing backup name (ex. ./backup.rb my_name)" unless ARGV[0]

SafeShell.execute("dropdb ncs_navigator_core_paul")
SafeShell.execute("dropdb psc_paul")

SafeShell.execute("createdb ncs_navigator_core_paul")
SafeShell.execute("createdb psc_paul")

SafeShell.execute("psql ncs_navigator_core_paul < #{ARGV[0]}/ncs_navigator_core_paul.dmp")
SafeShell.execute("psql psc_paul < #{ARGV[0]}/psc_paul.dmp")
