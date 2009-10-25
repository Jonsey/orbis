Given /^the following users already exist:$/ do |table|
  table.hashes.each do |user|
    User.create!(:login => user[:login],
                 :email => user[:email],
                 :password => user[:password],
                 :password_confirmation => user[:password])
  end
end
