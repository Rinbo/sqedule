Given("I click on {string}") do |button_or_link|
    click_on button_or_link
end

Given("I am on the Sign up page") do
    visit new_user_registration_path
end

Given("I fill in {string} with {string}") do |field, text|
    fill_in(field, with: text)
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