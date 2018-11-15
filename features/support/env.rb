require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'
require 'webmock/cucumber'
ActionController::Base.allow_rescue = false
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

WebMock.disable_net_connect!(allow_localhost: true)
#WebMock.allow_net_connect!

Cucumber::Rails::Database.javascript_strategy = :truncation

Chromedriver.set_version '2.36' unless ENV['CI'] == 'true'


chrome_options = %w(no-sandbox disable-popup-blocking disable-infobars)
chrome_options.concat(['headless', '--window-size=1920,1080', '--start-maximized']) if ENV['CI'] == 'true'

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
          args: chrome_options
      }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.server = :puma
Capybara.javascript_driver = :chrome

World(FactoryBot::Syntax::Methods)

Before '@webhook' do 
  WebMock.stub_request(:post, "https://ca-endpoints.herokuapp.com/api/optimizers").
  with(
    body: "{\"assignments\":[{\"id\":null,\"staff_id\":4,\"shift\":\"06:00-14:00 Receptionist\",\"date\":\"2018-11-01\"},{\"id\":null,\"staff_id\":3,\"shift\":\"06:00-14:00 Receptionist\",\"date\":\"2018-11-01\"},{\"id\":null,\"staff_id\":1,\"shift\":\"14:00-20:00 Manager\",\"date\":\"2018-11-01\"},{\"id\":null,\"staff_id\":2,\"shift\":\"06:00-14:00 Receptionist\",\"date\":\"2018-11-02\"},{\"id\":null,\"staff_id\":4,\"shift\":\"06:00-14:00 Receptionist\",\"date\":\"2018-11-02\"},{\"id\":null,\"staff_id\":1,\"shift\":\"14:00-20:00 Manager\",\"date\":\"2018-11-02\"},{\"id\":null,\"staff_id\":2,\"shift\":\"06:00-14:00 Receptionist\",\"date\":\"2018-11-03\"},{\"id\":null,\"staff_id\":4,\"shift\":\"06:00-14:00 Receptionist\",\"date\":\"2018-11-03\"},{\"id\":null,\"staff_id\":1,\"shift\":\"14:00-20:00 Manager\",\"date\":\"2018-11-03\"}]}",
    headers: {
          'Accept'=>'application/json',
          'Accept-Encoding'=>'gzip, deflate',
          'Content-Length'=>'811',
          'Content-Type'=>'application/json',
          'Host'=>'ca-endpoints.herokuapp.com',
          'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.1p57'
    }).
  to_return(status: 200, body: "", headers: {})
end