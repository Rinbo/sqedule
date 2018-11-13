Given("I click on {string}") do |button_or_link|
    click_on button_or_link
end

Given("I am on the Sign up page") do
    visit new_user_registration_path
end

Given("I fill in {string} with {string}") do |field, text|
    fill_in(field, with: text)
end

Given("I fill in {string} with Jan, 2018") do |field|
    element = page.find_by_id(field)
    element.send_keys :up
    element.send_keys :tab
    element.send_keys :up
end

Then("stop") do
    binding.pry
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

Given("the following schedules are in the database") do |table|
    table.hashes.each do |schedule|        
        create(:schedule, schedule)
    end
end

Given("the following patterns are in the database") do |table|
    table.hashes.each do |pattern_hash|
        @user = User.find_by(email: pattern_hash[:user])
        pattern_hash.except!("user")
        create(:pattern, pattern_hash.merge(user: @user))
    end   
end
  
Given("the following staff are in the database") do |table|
    table.hashes.each do |staff_hash|
        @user = User.find_by(email: staff_hash[:user])
        staff_hash.except!("user")
        create(:staff, staff_hash.merge(user: @user))
    end 
end

Given("the following shifts are in the database") do |table|
    table.hashes.each do |shifts_hash|
        @pattern = Pattern.find_by(shift_start: shifts_hash[:pattern])
        shifts_hash.except!("pattern")
        create(:shift, shifts_hash.merge(pattern: @pattern))
    end
end
  
Given("the following assignments are in the database") do |table|
    table.hashes.each do |assignments_hash|
        @staff = Staff.find_by(name: assignments_hash[:staff])
        assignments_hash.except!("staff")
        create(:assignment, assignments_hash.merge(staff: @staff))
    end
end

Then("I am on the Log in page") do
    visit new_user_session_path
end

Given("I am logged in as {string}") do |email|
    user = User.find_by_email(email)
    login_as user, scope: :user
end

Given("I click {string}") do |link|
    click_on link
end

Given("I visit the first planning period") do   
    visit schedule_path(Schedule.last)
  end
  
Given("I click checkbox {string}") do |checkbox|
    check checkbox
end

Given("I visit the schedule show page {string}") do |period|
    schedule = Schedule.find_by(period: period)
    visit schedule_path(schedule)
end

Given("I click on a new shift") do
    click_on "#{Schedule.last.period}-01_#{Pattern.last.id}"
end

Given("I select {string} from {string}") do |option, list|
    select option, from: list
end
  
Given("I click on a new assignment") do
    click_on "#{Schedule.last.period}-01_#{Staff.last.id}"
end

Then("I click on assignment edit link") do
    click_link "assignment_#{Assignment.last.id}"
end

Given("I fill in {string} with formatted time") do |field|
    element = page.find_by_id(field)
    element.send_keys :up
    element.send_keys :tab
    element.send_keys :up
    element.send_keys :tab
    element.send_keys :up
end

Then("wait") do
    sleep 1
end

