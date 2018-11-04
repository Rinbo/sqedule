Given("I am on the landing page") do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Given("I click on the {string} button") do |button|
    click_button button
end

Given("I am on the Sign up page") do
    visit new_user_registration_path
end

Given("I fill in {string} with {string}") do |field, text|
    fill_in(field, with: text)
end

Given("I see the message {string}") do |string|
pending # Write code here that turns the phrase above into concrete actions
end

Then("stop") do
    save_and_open_page
end

Given("I visit the landing page") do
  visit root_path
end