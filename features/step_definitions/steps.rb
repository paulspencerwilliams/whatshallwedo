Given(/^the following weather conditions exist$/) do |table|
  table.hashes.each do |attrs|
    create_weather(attrs[:Weather])     
  end
end

And(/^the following set of activites exist$/) do |table|
  table.hashes.each do |attrs|
    create_activity(attrs[:Activity], attrs[:Weather])
  end
end

Given(/^I visit the homepage$/) do
  visit '/'
end

Given(/^all activities are marked as done$/) do
  Activity.all.each { | activity | activity.update_attributes!(:done => true) } 
end

When(/^I refresh the page$/) do
  visit (current_path)
end

When(/^I choose "(.*?)"$/) do |weather|
  within('#criteria') do
    select(weather, :from => 'Weather')
    click_button('filter')
  end
end

When(/^I add the "(.*?)" suggestion "(.*?)"$/) do |weather, suggestion|
  within('#new_activity_form') do
    fill_in('Name', :with=> suggestion)
    select(weather, :from => 'Weather')
    click_button('Save')
  end
end

When(/^I mark "(.*?)" as done$/) do |activity|
  within_table('list_of_suggestions') do
    find(:xpath, "//tr[td[text()='#{activity}']]/td/form/input[@value='Done']").click
  end
end

Then(/^I will be presented with (\d+) random suggestions$/) do | expected_count |
  Activity.random_undone(10).count.should eq(expected_count)
  within_table('list_of_suggestions') do
    should have_xpath("//tbody//tr", :count => expected_count)
  end
end

Then(/^I should see the following suggestions$/) do |table|
  within_table('list_of_suggestions') do
    should have_xpath("//tbody//tr", :count => table.rows.count)
    table.hashes.each do | attrs | 
      should have_xpath("//tbody//tr", :text => attrs[:Activity])
    end
  end
end

Then(/^the "(.*?)" suggestion should be saved$/) do |name| 
  Activity.find_by(:name => name).should_not be_nil 
  page.should have_selector "#flash_notice", text: "'#{name}' created"
end


Then(/^"(.*?)" should still be selected$/) do |weather|
  within('#criteria') do
    field_labeled('Weather').find(:xpath, ".//option[@selected = 'selected'][text() = '#{weather}']").should be_present
  end
end

Then(/^"(.*?)" should be marked as done$/) do |name|
  Activity.find_by(:name => name).done.should be_true 
end

Transform /^(-?\d+)$/ do |number|
    number.to_i
end
