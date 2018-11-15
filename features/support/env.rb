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

#WebMock.disable_net_connect!(allow_localhost: true)
WebMock.allow_net_connect!

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
  WebMock.disable_net_connect!(allow_localhost: true)
  # WebMock.stub_request(:post, "https://ca-endpoints.herokuapp.com/api/optimizers").
  # with(
  #   body: "{\"shifts\":[{\"id\":1,\"date\":\"2018-11-01\",\"pattern_id\":1,\"cleaning\":false,\"staff_req\":1,\"created_at\":\"2018-11-15T18:48:15.704Z\",\"updated_at\":\"2018-11-15T18:48:15.704Z\"}],\"assignments\":[{\"id\":1,\"staff_id\":1,\"shift\":\"MyString\",\"created_at\":\"2018-11-15T18:48:15.739Z\",\"updated_at\":\"2018-11-15T18:48:15.739Z\",\"date\":\"2018-11-02\"}],\"patterns\":[{\"id\":1,\"shift_start\":\"2000-01-01T06:00:00.000Z\",\"created_at\":\"2018-11-15T18:48:15.692Z\",\"updated_at\":\"2018-11-15T18:48:15.692Z\",\"user_id\":1,\"break_length\":\"2000-01-01T00:15:00.000Z\",\"shift_end\":\"2000-01-01T16:59:27.000Z\",\"primary_role\":\"myString\"}],\"staffs\":[{\"id\":1,\"name\":\"Rolf\",\"employment_end\":\"2018-11-07\",\"shift_preference\":1,\"created_at\":\"2018-11-15T18:48:15.713Z\",\"updated_at\":\"2018-11-15T18:48:15.713Z\",\"user_id\":1,\"primary_role\":\"myString\",\"roles\":[]},{\"id\":2,\"name\":\"Bengt\",\"employment_end\":\"2018-11-07\",\"shift_preference\":1,\"created_at\":\"2018-11-15T18:48:15.721Z\",\"updated_at\":\"2018-11-15T18:48:15.721Z\",\"user_id\":1,\"primary_role\":\"myString\",\"roles\":[]},{\"id\":3,\"name\":\"Berit\",\"employment_end\":\"2018-11-07\",\"shift_preference\":1,\"created_at\":\"2018-11-15T18:48:15.727Z\",\"updated_at\":\"2018-11-15T18:48:15.727Z\",\"user_id\":1,\"primary_role\":\"myString\",\"roles\":[]},{\"id\":4,\"name\":\"Ronda\",\"employment_end\":\"2018-11-07\",\"shift_preference\":1,\"created_at\":\"2018-11-15T18:48:15.733Z\",\"updated_at\":\"2018-11-15T18:48:15.733Z\",\"user_id\":1,\"primary_role\":\"myString\",\"roles\":[]}]}",
  #   headers: {
  #         'Accept'=>'application/json',
  #         'Accept-Encoding'=>'gzip, deflate',
  #         'Content-Length'=>'1412',
  #         'Content-Type'=>'application/json',
  #         'Host'=>'ca-endpoints.herokuapp.com',
  #         'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.1p57'
  #   }).
  # to_return(status: 200, body: "", headers: {})
  WebMock.stub_request(:post, "https://ca-endpoints.herokuapp.com/api/optimizers").
  with(
    body: "{\"shifts\":[{\"id\":1,\"date\":\"2018-11-01\",\"pattern_id\":1,\"cleaning\":false,\"staff_req\":1,\"created_at\":\"2018-11-15T18:55:11.354Z\",\"updated_at\":\"2018-11-15T18:55:11.354Z\"}],\"assignments\":[{\"id\":1,\"staff_id\":1,\"shift\":\"MyString\",\"created_at\":\"2018-11-15T18:55:11.385Z\",\"updated_at\":\"2018-11-15T18:55:11.385Z\",\"date\":\"2018-11-02\"}],\"patterns\":[{\"id\":1,\"shift_start\":\"2000-01-01T06:00:00.000Z\",\"created_at\":\"2018-11-15T18:55:11.347Z\",\"updated_at\":\"2018-11-15T18:55:11.347Z\",\"user_id\":1,\"break_length\":\"2000-01-01T00:15:00.000Z\",\"shift_end\":\"2000-01-01T16:59:27.000Z\",\"primary_role\":\"myString\"}],\"staffs\":[{\"id\":1,\"name\":\"Rolf\",\"employment_end\":\"2018-11-07\",\"shift_preference\":1,\"created_at\":\"2018-11-15T18:55:11.361Z\",\"updated_at\":\"2018-11-15T18:55:11.361Z\",\"user_id\":1,\"primary_role\":\"myString\",\"roles\":[]},{\"id\":2,\"name\":\"Bengt\",\"employment_end\":\"2018-11-07\",\"shift_preference\":1,\"created_at\":\"2018-11-15T18:55:11.367Z\",\"updated_at\":\"2018-11-15T18:55:11.367Z\",\"user_id\":1,\"primary_role\":\"myString\",\"roles\":[]},{\"id\":3,\"name\":\"Berit\",\"employment_end\":\"2018-11-07\",\"shift_preference\":1,\"created_at\":\"2018-11-15T18:55:11.373Z\",\"updated_at\":\"2018-11-15T18:55:11.373Z\",\"user_id\":1,\"primary_role\":\"myString\",\"roles\":[]},{\"id\":4,\"name\":\"Ronda\",\"employment_end\":\"2018-11-07\",\"shift_preference\":1,\"created_at\":\"2018-11-15T18:55:11.380Z\",\"updated_at\":\"2018-11-15T18:55:11.380Z\",\"user_id\":1,\"primary_role\":\"myString\",\"roles\":[]}]}",
    headers: {
          'Accept'=>'application/json',
          'Accept-Encoding'=>'gzip, deflate',
          'Content-Length'=>'1412',
          'Content-Type'=>'application/json',
          'Host'=>'ca-endpoints.herokuapp.com',
          'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.1p57'
    }).
  to_return(status: 200, body: "", headers: {})



end