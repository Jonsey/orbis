Given /^the following users already exist:$/ do |table|
  table.hashes.each do |user|
    usr = User.create!(:login => user[:login],
                 :email => user[:email],
                 :password => user[:password],
                 :password_confirmation => user[:password])
    if user[:usergroup] == "Administrator"
      Lockdown::System.make_user_administrator(usr)
    else
      usr.user_groups << UserGroup.find_by_name(user[:usergroup])
    end unless user[:usergroup] == ""
    usr.save!
  end
end

Given /^I am logged in as "([^\"]*)" with "([^\"]*)"$/ do |login, password|
  visit login_path
  fill_in "Login", :with => login
  fill_in "Password", :with => password
  click_button "Login"
end




