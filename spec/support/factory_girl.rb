RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  begin
    FactoryGirl.lint
  end
end
