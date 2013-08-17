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

When(/^I choose 'Sunny'$/) do
  within('#criteria') do
    select('Sunny', :from => 'Weather')
    click_button('filter')
  end
end

Then(/^I will be presented with 10 random suggestions$/) do
  within_table('list_of_suggestions') do
    should have_xpath("//tbody//tr", :count => 10)
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

