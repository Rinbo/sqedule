Then("I should see {string}") do |content|
  expect(page).to have_content content
end

Then("I see the message {string}") do |notice|
  expect(page).to have_css(".notice")
end
