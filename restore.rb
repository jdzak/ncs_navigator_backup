require File.expand_path('../constants.rb', __FILE__)

include Constants

raise "Missing backup name (ex. ./backup.rb my_name)" unless ARGV[0]
d = File.join('backup', ARGV[0])

command "Drop Cases Database" do
	%x{dropdb "ncs_navigator_core_paul"}
end

command "Drop PSC Database" do
	%x{dropdb "psc_paul"}
end

command "Create Cases Database" do
	%x{createdb "ncs_navigator_core_paul"}
end

command "Create PSC Database" do
	%x{createdb "psc_paul"}
end

command "Restore Cases" do
	%x{psql "ncs_navigator_core_paul" < "#{d}/ncs_navigator_core_paul.dmp"}
end

command "Restore PSC" do
	%x{psql "psc_paul" < "#{d}/psc_paul.dmp"}
end

command "Restore Field" do
	%x{cp "#{d}/main.sqlite" "#{Constants::IOS}"}
end
