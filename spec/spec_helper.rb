RSpec.configure do |config|
  config.backtrace_exclusion_patterns = [
      /gems/
  ]
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end