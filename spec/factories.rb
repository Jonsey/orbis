Factory.define :user_group do |cd|
  cd.name 'Client'
end

Factory.define :user do |c|
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "User"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.sequence(:email) {|n| "user#{n}@example.com" }
end

Factory.define :staff, :class => Staff do |c|
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "Staff"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.sequence(:email) {|n| "staff#{n}@example.com" }
end

Factory.define :client, :class => Client do |c|
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "Client"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.sequence(:email) {|n| "client#{n}@example.com" }
  c.company_name 'Space tech'
end

Factory.define :candidate, :class => Candidate do |c|
  c.password 'password'
  c.password_confirmation 'password'
  c.firstname "Candidate"
  c.lastname "Jones"
  c.telephone '07010 717232'
  c.sequence(:email) {|n| "candidate#{n}@example.com" }
end

Factory.define :category, :class => Category do |c|
  c.parent_id nil
  c.name "Technology"
end


Factory.define :vacancy, :class => Vacancy do |v|
  v.role 'Senior Ruby developer'
  v.association :category
  v.salary '50000'
  v.location 'Space'
  v.role_description 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  v.association :client
  v.association :staff
  v.status 'draft'
end



