When /^I do not fill out any fields$/ do
  true
end

Then /^I should have (.+) rows of (.+)$/ do |count, object|
  response.should have_tag("table") do
    with_tag("tr", :times => count.to_i)
  end
end

Then /^the (.+) should have the status of "([^\"]*)"$/ do |object_name, status|
  object_name.capitalize.constantize.find(:all)[0].status.should eql(status)
end

Then /^a new (.+) notification should be sent$/ do |type|
  pending
end

Then /^I should see a link with title "([^\"]*)"$/ do |link_title|
  response.should have_tag("a[title='#{link_title}']")
end

Then /^I should not see a link with title "([^\"]*)"$/ do |link_title|
  response.should_not have_tag("a[title='#{link_title}']")
end

