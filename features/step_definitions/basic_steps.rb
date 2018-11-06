Given("I click on the {string} button") do |button|
    click_button button
end

Given("I am on the Sign up page") do
    visit new_user_registration_path
end

Given("I fill in {string} with {string}") do |field, text|
    fill_in(field, with: text)
end

Given("I fill in {string} with 1st of Jan, 2018") do |field|
    element = page.find_by_id(field)
    element.send_keys :up
    element.send_keys :tab
    element.send_keys :up
end

Then("stop") do
    save_and_open_page
end

Given("I visit the landing page") do
    visit root_path
end

Then("I end up on the landing page") do
    expect(current_path).to eq root_path    
end

Given("the following user is registered") do |table|
    table.hashes.each do |user|
      create(:user, user)
    end
end
  
Then("I am on the Log in page") do
    visit new_user_session_path
end

Given("I am logged in as {string}") do |user|
    login_as user
end

Given("I click {string}") do |link|
    click_on link
end
