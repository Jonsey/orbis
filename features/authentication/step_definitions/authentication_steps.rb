Given /^an exisiting admin user with login "([^\"]*)"$/ do |login|
  usr = User.create!(:login => login,
                     :email => 'email@example.com',
                     :password => 'password',
                     :password_confirmation => 'password')
  Lockdown::System.make_user_administrator(usr)
end

Given /^the following clients already exist:$/ do |table|
  table.hashes.each do |user|
    usr = Client.create!(:login => user[:login],
                         :firstname => 'Damian',
                         :lastname => 'Jones',
                         :telephone => '07010 717232',
                         :email => user[:email],
                         :password => user[:password],
                         :password_confirmation => user[:password],
                         :company_name => "Company")

    usr.user_groups << UserGroup.find_by_name(user[:usergroup]) unless user[:usergroup] == ""
    usr.save!
  end
end

When /^I login as "([^\"]*)"$/ do |login|
  visit login_path
  fill_in "Login", :with => login
  fill_in "Password", :with => "password"
  click_button "Login"
end

Given /^I am logged in as a (.+)$/ do |user_type|
  user = Factory.create(user_type.downcase.to_sym)
  user.user_groups << UserGroup.find_by_name(user_type.capitalize.pluralize)

  visit login_path
  fill_in "Login", :with => user.login
  fill_in "Password", :with => user.password
  click_button "Login"
end
