Given /^I have a user called (.+) with a password (.+)$/ do |user, password|
  visit root_path

  fill_in 'create_username', with: user
  fill_in 'create_password', with: password
  fill_in 'create_password_confirmation', with: password

  click_button 'Sign up'

  @password ||= {}
  @password[user] = password
end

Given /^I am logged in as (.+)$/ do |user|
  visit root_path

  fill_in 'login_username', with: user
  fill_in 'login_password', with: @password[user]

  click_button 'Login'
end

When /^I log in as (.+) with a password (.+)$/ do |user, password|
  visit root_path

  fill_in 'login_username', with: user
  fill_in 'login_password', with: password

  click_button 'Login'
end

Then /^I should be welcomed as (.+)$/ do |user|
  expect(page).to have_content("Welcome, #{user}!")
end

Then /^I should be redirected to login$/ do
  expect(page).to have_content("Signup")
end
