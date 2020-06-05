require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

class Test::Unit::TestCase
  include FactoryBot::Syntax::Methods
end
