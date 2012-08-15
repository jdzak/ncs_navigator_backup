require 'rubygems'
require 'safe_shell'

raise "Missing backup name (ex. ./backup.rb my_name)" unless ARGV[0]

SafeShell.execute("mkdir", ARGV[0])
SafeShell.execute("pg_dump", "ncs_navigator_core_paul", :stdout => "#{ARGV[0]}/ncs_navigator_core_paul.dmp")
SafeShell.execute("pg_dump", "psc_paul", :stdout => "#{ARGV[0]}/psc_paul.dmp")
SafeShell.execute("cp", "psc_paul" "#{ARGV[0]}/main.sqlite")