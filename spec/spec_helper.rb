# Run Coverage report
require 'simplecov'
SimpleCov.start do
  add_group 'Libraries', 'lib'
end


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|

  # Infer an example group's spec type from the file location.
  config.infer_spec_type_from_file_location!

  config.mock_with :rspec
  config.color = true
end
