
require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:rspec) do |t|
	t.pattern = 'spec/*/*_spec.rb'
	t.rspec_opts = File.read("spec/spec.opts").chomp || ""
end

