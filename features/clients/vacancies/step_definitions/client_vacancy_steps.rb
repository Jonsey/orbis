
Given /^I fill out all the fields for a vacancy$/ do
  select( 'Technology',       :from => 'category')
  fill_in('Role',             :with => 'Role')
  fill_in('Salary',           :with => '50,000')
  fill_in('Location',         :with => 'Location')
  fill_in('Role description', :with => 'Role description')
end



Given /^the following vacancies already exist:$/ do |vacancies|
  vacancies.hashes.each do |v|
    Vacancy.create!(:category         => Category.create!(:name => v[:category]),
                    :role             => v[:role],
                    :salary           => v[:salary],
                    :location         => v[:location],
                    :role_description => v[:role_description],
                    :client           => Client.find_by_email(v[:client]))
  end

end

#Then /^I should have (.+) vacancy with status "([^\"]*)"$/ do |count, status|
#  Vacancy.with_status(status).count.should eql(count.to_i)
#end

Given /^I have a vacancy with status: "([^\"]*)"$/ do |status|
  Factory.create(:vacancy, :client_id => controller.session[:current_user_id], :status => status.gsub(' ', '_'))
end

Given /^the default categories$/ do
  Category.create!(:name => "Technology")
  Category.create!(:name => "Accountancy & Finance")
end
