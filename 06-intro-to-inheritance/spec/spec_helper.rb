require_relative '../config/environment'

RSpec.configure do |config|
  RSpec::Expectations.configuration.on_potential_false_positives = :nothing
end
