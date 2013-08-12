Given(/^the following set of activites exist$/) do |table|

  table.hashes.each do |attrs|
    create_activity(attrs[:activity], attrs[:weather])
  end
end

Given(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I will be presented with 10 random suggestions$/) do
  within_table('list_of_suggestions') do
    should have_xpath("//tbody//tr", :count => 10)
  end

end
