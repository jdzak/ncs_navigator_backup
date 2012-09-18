require File.expand_path('../constants.rb', __FILE__)

include Constants

raise "Missing backup name (ex. ./backup.rb my_name)" unless ARGV[0]
d = File.join('backup', ARGV[0])

command "Create directory #{d}" do
	%x{mkdir -p "#{d}"}
end

command "Backup Cases" do
	%x{pg_dump "ncs_navigator_core_paul" > "#{d}/ncs_navigator_core_paul.dmp"}
end

command "Backup PSC" do
	%x{pg_dump "psc_paul" > "#{d}/psc_paul.dmp"}
end

command "Backup Field" do
	%x{cp "#{Constants::IOS}" "#{d}/main.sqlite"}
end
