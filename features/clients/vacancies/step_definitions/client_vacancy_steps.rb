
Given /^I fill out all the fields for a vacancy$/ do
 # fill_in('Title',            :with => 'Title')
  fill_in('Role',             :with => 'Role')
  fill_in('Salary',           :with => '50,000')
  fill_in('Location',         :with => 'Location')
 # fill_in('Duration',         :with => '2 Months')
 # fill_in('Key skills',       :with => 'Key skills')
  fill_in('Role description', :with => 'Role description')
end


Given /^the following vacancies already exist:$/ do |vacancies|
  vacancies.hashes.each do |v|
    Vacancy.create!(# :title            => v[:title],
                     :role             => v[:role],
                     :salary           => v[:salary],
                     :location         => v[:location],
                    # :duration         => v[:duration],
                    # :key_skills       => v[:key_skills],
                     :role_description => v[:role_description],
                     :client_id        => Client.find_by_email(v[:client]).id )
  end

end

Then /^I should have (.+) vacancy with status "([^\"]*)"$/ do |count, status|
  Vacancy.with_status(status).count.should eql(count.to_i)
end

Given /^I have one vacancy with status "([^\"]*)"$/ do |status|
  Factory.create(:vacancy, :client_id => session[:current_user_id], :status => status.gsub(' ', '_'))
end
