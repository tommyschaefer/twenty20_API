require 'twenty20'
require 'webmock/rspec'
require 'vcr'
WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
    c.cassette_library_dir = 'fixtures/vcr_cassettes'
    c.hook_into :webmock # or :fakeweb
end


RSpec.configure do |config|
  config.expose_current_running_example_as :example
  config.raise_errors_for_deprecations!
end
