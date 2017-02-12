$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simple_git_workflow'
require 'rake'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.hook_into                :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :new_episodes }
end


